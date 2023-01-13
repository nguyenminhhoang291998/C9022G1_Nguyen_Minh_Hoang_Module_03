use create_table;

-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra
-- xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn
-- ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu
-- không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất
-- là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
drop trigger tr_cap_nhat_hop_dong;

delimiter //
create trigger tr_cap_nhat_hop_dong
before update on hop_dong
for each row 
begin
if day(new.ngay_ket_thuc) - day(old.ngay_lam_hop_dong) < 2 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
end if;
end //
delimiter ;

SET SQL_SAFE_UPDATES = 0;
update hop_dong
set ngay_ket_thuc = '2022-07-15'
where ma_hop_dong = 2;

-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm
-- hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng
--  thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng).
-- Mã của khách hàng được truyền vào như là 1 tham số của function này.
create view v_dich_vu as
select 
  k.ma_khach_hang, 
  k.ho_ten, 
  l.ten_loai_khach, 
  h.ma_hop_dong, 
  d.ten_dich_vu, 
  h.ngay_lam_hop_dong, 
  h.ngay_ket_thuc, 
   (ifnull(d.chi_phi_thue,0) + sum(ifnull(hd.so_luong,0)*ifnull(dv.gia,0))) as tong_tien
from 
  khach_hang k 
  left join loai_khach l on k.ma_loai_khach = l.ma_loai_khach 
  left join hop_dong h on k.ma_khach_hang = h.ma_khach_hang 
  left join dich_vu d on h.ma_dich_vu = d.ma_dich_vu 
  left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong 
  left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem 
group by 
  h.ma_hop_dong;
  
  select * from v_dich_vu;


delimiter //
create function func_dem_dich_vu()
return int
deterministic
begin 
declare tong int;
if()
end //
delimiter ;


-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với
-- loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là
-- xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa
-- những bản gi trong bảng hop_dong) và những bản liên quan khác.
