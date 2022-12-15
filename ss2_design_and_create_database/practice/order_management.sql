create database order_management;
use order_management;

create table nha_cc(
	ma_ncc int primary key auto_increment,
	ten_ncc varchar(30),
	dia_chi varchar(30),
	sdt varchar(10)
);

create table sdt(
	sdt varchar(10) ,
	ma_ncc int,
	primary key(sdt,ma_ncc),
	foreign key (ma_ncc) references nha_cc(ma_ncc)
);



create table don_dh(
	so_hd int primary key auto_increment,
	ngay_hd date,
	cung_cap int,
	foreign key (cung_cap)
	references nha_cc(ma_ncc)
);

create table vat_tu(
	ma_vt int primary key auto_increment,
	ten_vt varchar(30)
);

create table chi_tiet_don_dat_hang(
	so_hd int,
	ma_vt int,
	primary key(so_hd,ma_vt),
	foreign key (ma_vt) references vat_tu(ma_vt),
	foreign key (so_hd) references don_dh(so_hd)
);

create table phieu_nhap(
	so_pn int  primary key auto_increment,
	ngay_nhap date	
);

create table chi_tiet_phieu_nhap(
	dg_nhap int,
	sl_nhap int,
	primary key(dg_nhap,sl_nhap),
	ma_vt int,
	so_pn int,
	foreign key (ma_vt) references vat_tu(ma_vt),
	foreign key (so_pn) references phieu_nhap(so_pn)
);

create table phieu_xuat(
	so_px int primary key auto_increment,
	ngay_xuat date
);

create table chi_tiet_phieu_xuat(
	dg_xuat int,
	sl_xuat int,
	 primary key(dg_xuat,sl_xuat),
	so_px int,
	ma_vt int,
	foreign key (so_px) references  phieu_xuat(so_px),
	foreign key (ma_vt) references  vat_tu(ma_vt)
);