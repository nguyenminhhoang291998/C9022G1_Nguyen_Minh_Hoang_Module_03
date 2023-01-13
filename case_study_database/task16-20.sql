use create_table;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set 
  sql_safe_updates = 0;
delete from 
  nhan_vien 
where 
  ma_nhan_vien not in (
    select 
      ma_nhan_vien 
    from 
      hop_dong 
    where 
      year(ngay_lam_hop_dong) in (2019, 2020, 2021) 
    group by 
      ma_nhan_vien
  );

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm
-- 2021 là lớn hơn 10.000.000 VNĐ.
update 
  khach_hang 
set 
  ma_loai_khach = 1 
where 
  ma_khach_hang in (
    select 
      B.mkh 
    from 
      (
        select 
          A.mkh as mkh, 
          sum(A.cpt + A.ttdvdk) as ttkh 
        from 
          (
            select 
              h.ma_khach_hang as mkh, 
              d.chi_phi_thue as cpt, 
              (
                ifnull(d.chi_phi_thue, 0) + sum(
                  ifnull(hd.so_luong, 0)* ifnull(dv.gia, 0)
                )
              ) as ttdvdk 
            from 
              hop_dong h 
              left join dich_vu d on h.ma_dich_vu 
              left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong 
              left join dich_vu_di_kem dv on dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem 
              left join khach_hang k on k.ma_khach_hang = h.ma_khach_hang 
              left join loai_khach l on l.ma_loai_khach = k.ma_loai_khach 
            where 
              year(h.ngay_lam_hop_dong) = 2021 
              and l.ten_loai_khach = 'Platinium' 
            group by 
              h.ma_hop_dong
          ) as A 
        group by 
          A.mkh 
        having 
          ttkh > 1000000
      ) as B
  );

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET  FOREIGN_KEY_CHECKS  =  1 ;
set sql_safe_updates = 0;
SET  FOREIGN_KEY_CHECKS  =  0 ;
delete from 
  khach_hang 
where 
  khach_hang.ma_khach_hang in (
    select 
      * 
    from 
      (
        select 
          k.ma_khach_hang 
        from 
          khach_hang k 
          join hop_dong h on k.ma_khach_hang = h.ma_khach_hang 
        where 
          year(ngay_lam_hop_dong) < 2021
      ) as a
  );

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update 
  dich_vu_di_kem dv 
set 
  dv.gia = dv.gia * 2 
where 
  dv.ma_dich_vu_di_kem in (
    select 
      hd.ma_dich_vu_di_kem 
    from 
      hop_dong_chi_tiet hd 
      join hop_dong h on h.ma_hop_dong = hd.ma_hop_dong 
    where 
      year(h.ngay_lam_hop_dong) = 2020 
    group by 
      hd.ma_dich_vu_di_kem 
    having 
      sum(hd.so_luong) > 10
  );

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang),
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
  ma_nhan_vien as ma, 
  ngay_sinh, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  nhan_vien 
union all 
select 
  ma_khach_hang, 
  ngay_sinh, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  khach_hang;
