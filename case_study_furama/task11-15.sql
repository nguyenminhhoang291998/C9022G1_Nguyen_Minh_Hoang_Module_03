-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có 
-- ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
use create_table;

select dv.* from dich_vu_di_kem dv 
join hop_dong_chi_tiet hd on dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem
join hop_dong h on h.ma_hop_dong = hd.ma_hop_dong
join khach_hang k on k.ma_khach_hang = h.ma_khach_hang
join loai_khach l on l.ma_loai_khach = k.ma_loai_khach
where l.ten_loai_khach = 'diamond' and (k.dia_chi like "%vinh" or k.dia_chi like"%quảng ngãi") ;

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa
-- trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã
-- từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng
-- đặt vào 6 tháng đầu năm 2021.

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng
-- đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy
-- nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem,
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng
-- từ năm 2020 đến 2021.
