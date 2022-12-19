use create_table;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu 
-- là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select 
  * 
from 
  nhan_vien 
where 
  char_length(ho_ten)<= 15 
  and (
    substring_index(ho_ten, " ",-1) like "H%" 
    or substring_index(ho_ten, " ",-1) like "T%" 
    or substring_index(ho_ten, " ",-1) like "K%"
  );


-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 
-- 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select 
  * 
from 
  khach_hang 
where 
  (
    (
      year(
        curdate()
      ) - year(ngay_sinh)
    ) between 18 
    and 50
  ) 
  and (
    dia_chi like "%đà nẵng" 
    or dia_chi like "%quảng trị"
  );


-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select 
  k.ma_khach_hang, 
  k.ho_ten, 
  count(k.ma_khach_hang) as 'số lần đặt' 
from 
  khach_hang k 
  join hop_dong h 
  join loai_khach l on k.ma_khach_hang = h.ma_khach_hang 
  and k.ma_loai_khach = l.ma_loai_khach 
where 
  l.ten_loai_khach = 'diamond' 
group by 
  k.ma_khach_hang 
order by 
  count(k.ma_khach_hang);



-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo 
-- công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng 
-- dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select 
  k.ma_khach_hang, 
  k.ho_ten, 
  l.ten_loai_khach, 
  h.ma_hop_dong, 
  d.ten_dich_vu, 
  h.ngay_lam_hop_dong, 
  h.ngay_ket_thuc, 
  ifnull(
    (
      d.chi_phi_thue + sum(hd.so_luong * dv.gia)
    ), 
    d.chi_phi_thue
  ) as "Tổng tiền" 
from 
  khach_hang k 
  left join loai_khach l on k.ma_loai_khach = l.ma_loai_khach 
  left join hop_dong h on k.ma_khach_hang = h.ma_khach_hang 
  left join dich_vu d on h.ma_dich_vu = d.ma_dich_vu 
  left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong 
  left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem 
group by 
  h.ma_hop_dong 
order by 
  k.ma_khach_hang asc, 
  h.ma_hop_dong desc;

