use create_table;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as 
select 
  n.* 
from 
  nhan_vien n 
  join hop_dong h 
where 
  n.dia_chi like "%Hải Châu%" 
  and h.ngay_lam_hop_dong = '2019-12-12';

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu”
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set 
  sql_safe_updates = 0;
update 
  v_nhan_vien 
set 
  dia_chi = 'Liên Chiểu';

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang
-- được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter // create procedure sp_xoa_khach_hang(id int) begin 
delete from 
  khach_hang 
where 
  ma_khach_hang = id;
end // delimiter ;

call sp_xoa_khach_hang(11);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu
-- sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc
-- không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter // create procedure sp_them_moi_hop_dong(
  ma_hop_dong_moi int, ngay_lam_hop_dong_moi datetime, 
  ngay_ket_thuc_moi datetime, tien_dat_coc_moi double, 
  ma_nhan_vien_moi int, ma_khach_hang_moi int, 
  ma_dich_vu_moi int
) begin declare c1, 
c2, 
c3, 
c4 int;
set 
  c1 = 0, 
  c2 = 0, 
  c3 = 0, 
  c4 = 0;
select 
  count(*) into c1 
from 
  hop_dong 
where 
  ma_hop_dong_moi = ma_hop_dong;
select 
  count(*) into c2 
from 
  nhan_vien 
where 
  ma_nhan_vien_moi not in(
    select 
      ma_nhan_vien 
    from 
      nhan_vien
  );
select 
  count(*) into c3 
from 
  khach_hang 
where 
  ma_khach_hang_moi not in(
    select 
      ma_khach_hang 
    from 
      khach_hang
  );
select 
  count(*) into c4 
from 
  dich_vu 
where 
  ma_dich_vu_moi not in(
    select 
      ma_dich_vu 
    from 
      dich_vu
  );
if c1 = 0 
and c2 = 0 
and c3 = 0 
and c4 = 0 then insert into hop_dong 
values 
  (
    ma_hop_dong_moi, ngay_lam_hop_dong_moi, 
    ngay_ket_thuc_moi, tien_dat_coc_moi, 
    ma_nhan_vien_moi, ma_khach_hang_moi, 
    ma_dich_vu_moi
  );
end if;
end // delimiter;

call sp_them_moi_hop_dong(19,'2022-02-02','2022-02-03',22000,2,2,1);

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng
-- số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
create table dem_ban_ghi(
  tong int, delete_day datetime default now()
);

delimiter // create trigger trigger_dem_ban_ghi 
after 
  delete on hop_dong for each row begin insert into dem_ban_ghi (tong) 
values 
  (
    (
      select 
        count(*) 
      from 
        hop_dong
    )
  );
end // delimiter ;
