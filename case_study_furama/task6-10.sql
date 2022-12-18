use create_table;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 
-- của năm 2021 (Quý 1 là tháng 1, 2, 3).

select d.ma_dich_vu, d.ten_dich_vu, d.dien_tich, d.chi_phi_thue, d.ten_dich_vu
from dich_vu d join hop_dong h on d.ma_dich_vu = h.ma_dich_vu
where d.ma_dich_vu
not in (select d.ma_dich_vu
where (((year(h.ngay_lam_hop_dong) =2021 and month(h.ngay_lam_hop_dong) in (1,2,3))
or (year(h.ngay_ket_thuc) =2021 and month(h.ngay_ket_thuc) in (1,2,3) ))
and ( year((h.ngay_lam_hop_dong) =2021 and month(h.ngay_lam_hop_dong) in (1,2,3))
or (year(h.ngay_ket_thuc) =2021 and month(h.ngay_ket_thuc) in (1,2,3) ))))
group by d.ma_dich_vu;

