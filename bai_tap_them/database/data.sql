create database bai_tap_them;
use bai_tap_them;
create table xuat_xu_heo(
ma_xuat_xu int primary key,
ten_nuoc varchar(25)
);

create table heo(
ma_heo varchar(25) primary key,
ngay_nhap_chuong date,
trong_luong_khi_nhap int,
thoi_gian_xuat_chuong date,
trong_luong_khi_xuat int,
ma_xuat_xu int,
foreign key (ma_xuat_xu) references xuat_xu_heo(ma_xuat_xu) on delete cascade
);

INSERT INTO `bai_tap_them`.`xuat_xu_heo` (`ma_xuat_xu`, `ten_nuoc`) VALUES ('1', 'Việt Nam');
INSERT INTO `bai_tap_them`.`xuat_xu_heo` (`ma_xuat_xu`, `ten_nuoc`) VALUES ('2', 'Mỹ');
INSERT INTO `bai_tap_them`.`xuat_xu_heo` (`ma_xuat_xu`, `ten_nuoc`) VALUES ('3', 'Trung Quốc');
INSERT INTO `bai_tap_them`.`xuat_xu_heo` (`ma_xuat_xu`, `ten_nuoc`) VALUES ('4', 'Đức');

select h.* , x.ten_nuoc from heo h join xuat_xu_heo x on h.ma_xuat_xu = x.ma_xuat_xu;

select h.* , x.ten_nuoc from heo h join xuat_xu_heo x on h.ma_xuat_xu = x.ma_xuat_xu 
WHErE h.ma_heo like '%MH-00%' and x.ten_nuoc like "%Việt Nam%";


