use create_table;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có 
-- ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select 
  dv.* 
from 
  dich_vu_di_kem dv 
  join hop_dong_chi_tiet hd on dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem 
  join hop_dong h on h.ma_hop_dong = hd.ma_hop_dong 
  join khach_hang k on k.ma_khach_hang = h.ma_khach_hang 
  join loai_khach l on l.ma_loai_khach = k.ma_loai_khach 
where 
  l.ten_loai_khach = 'diamond' 
  and (
    k.dia_chi like "%vinh" 
    or k.dia_chi like "%quảng ngãi"
  );

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa
-- trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã
-- từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng
-- đặt vào 6 tháng đầu năm 2021.
select 
  h.ma_hop_dong, 
  n.ho_ten, 
  k.ho_ten, 
  k.so_dien_thoai, 
  d.ten_dich_vu, 
  sum(hd.so_luong), 
  h.tien_dat_coc 
from 
  hop_dong h 
  join nhan_vien n on h.ma_nhan_vien = n.ma_nhan_vien 
  join khach_hang k on h.ma_khach_hang = k.ma_khach_hang 
  join dich_vu d on h.ma_dich_vu = d.ma_dich_vu 
  join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong 
where 
  h.ma_hop_dong in (
    select 
      ma_hop_dong 
    from 
      hop_dong 
    where 
      year(ngay_lam_hop_dong) = 2020 
      and quarter(ngay_lam_hop_dong)= 4
  ) 
  and h.ma_hop_dong not in (
    select 
      ma_hop_dong 
    from 
      hop_dong 
    where 
      year(ngay_lam_hop_dong) = 2021 
      and quarter(ngay_lam_hop_dong) in (1, 2)
  ) 
group by 
  h.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng
-- đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select 
  dv.ma_dich_vu_di_kem, 
  dv.ten_dich_vu_di_kem, 
  sum(hd.so_luong) as so_luong_dich_vu_di_kem 
from 
  dich_vu_di_kem dv 
  join hop_dong_chi_tiet hd on dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem 
group by 
  dv.ma_dich_vu_di_kem 
having 
  sum(hd.so_luong) = (
    select 
      sum(so_luong) 
    from 
      hop_dong_chi_tiet 
    group by 
      ma_dich_vu_di_kem 
    order by 
      sum(so_luong) desc 
    limit 
      1
  );

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy
-- nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem,
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
-- Tắt chế độ của mySQL
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- Mở chế độ của mySQL như cũ
 SET sql_mode=(SELECT CONCAT(@@sql_mode, ',ONLY_FULL_GROUP_BY'));
 
select 
  h.ma_hop_dong, 
  l.ten_loai_dich_vu, 
  dv.ten_dich_vu_di_kem, 
  count(hd.ma_dich_vu_di_kem) as so_lan_su_dung 
from 
  hop_dong_chi_tiet hd 
  join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem 
  join hop_dong h on h.ma_hop_dong = hd.ma_hop_dong 
  join dich_vu d on d.ma_dich_vu = h.ma_dich_vu 
  join loai_dich_vu l on l.ma_loai_dich_vu = d.ma_loai_dich_vu 
group by 
  hd.ma_dich_vu_di_kem 
having 
  so_lan_su_dung = 1 
order by 
  hd.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng
-- từ năm 2020 đến 2021.
select 
  n.ma_nhan_vien, 
  n.ho_ten, 
  t.ten_trinh_do, 
  b.ten_bo_phan, 
  n.so_dien_thoai, 
  n.dia_chi 
from 
  nhan_vien n 
  join trinh_do t on t.ma_trinh_do = n.ma_trinh_do 
  join bo_phan b on b.ma_bo_phan = n.ma_bo_phan 
  join hop_dong h on h.ma_nhan_vien = n.ma_nhan_vien 
where 
  year(h.ngay_lam_hop_dong) in (2020, 2021) 
group by 
  h.ma_nhan_vien 
having 
  count(h.ma_nhan_vien) <= 3 
order by 
  n.ma_nhan_vien;
