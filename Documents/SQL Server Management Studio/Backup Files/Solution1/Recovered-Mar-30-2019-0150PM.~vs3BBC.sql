create database quanlynhathuoc;
go
use quanlynhathuoc
go

create table khachhang(
	makh char(10) not NULL primary key,
	tenkh varchar(30),
	sodt int,
	diachi varchar(30));

create table nhanvien (
	manv char(10) not NULL primary key,
	hoten varchar(30),
	ngaysinh date, 
	sodt int );

create table hangsx (
	mahangsx char(10) not NULL primary key,
	tenhang varchar(20),
	quocgia varchar(50) );

create table nhacungcap (
	manhacc char(10)not NULL primary key,
	tennhacc varchar(50),
	diachi varchar(30));
create table loaithuoc (
	maloai varchar(10) not NULL primary key,
	tenloai varchar(20),
	ghichu varchar(50));

create table thuoc (
	mathuoc varchar(10) not NULL primary key,
	tenthuoc varchar(50),
	mahangsx char(10)  foreign key (mahangsx) references hangsx(mahangsx) ,
	manhacc char(10) foreign key (manhacc) references nhacungcap(manhacc),
	congdung varchar(200),
	maloai varchar(10), foreign key (maloai) references loaithuoc(maloai)) ;

create table phieunhap (
	mapn char(10) not NULL primary key,
	manv char(10) foreign key(manv) references nhanvien(manv) ,
	ngaynhap date );

create table phieuxuat (
	mapx char(10) not NULL primary key,
	manv char(10) foreign key(manv) references nhanvien(manv),
	ngayxuat date );


	

	insert into khachhang
	values ('A01',' Nguyen V?n Nam ','099384857','Ha Noi'),('A02',N' Nguyen Huy Hung ','073673644',N'Ha Nam '),('A03',N' Pham Thanh Nga ','0895454847',N'Bac Ninh')
	 insert into nhanvien
	 values ('B01','Tran Thanh Nga','2/2/1998','0999928928'),('B02',N'Pham Thanh Trung ','1/12/1995','0746782478'),('B03',N'Nguyen Thanh Nga','11/10/1994','0875837878')
	 insert into hangsx
	 values ('C01','Cretd','USA'),('C02','Melem','Phiplipin'),('C03','Destr','Japan')
	 insert into nhacungcap
	 values ('D01','Valus','Bold'),('D02','Buld' ,'Crets'),('D03','Henkai','Bigh')
	 insert into loaithuoc
	 values ('E01','Nahid',N'thu?c tr? tr?'),('E02','Hsdbh',N'Thu?c tr? huy?t áp'),('E03','Beatd',N'Thu?c tr? viêm')
	 insert into thuoc
	 values ('F01','Csirt','C01','D01','Cudhf','E01'),('F02','Blist','C02','D02','Astre','E02'),('F03','Miest','C03','D03','Kistd','E03')
	 insert into phieunhap
	 values ('N01','B01','2/2/2019'),('N02','B02','11/3/2014'),('N03','B03','1/4/2019')
	 insert into phieuxuat
	 values ('M01','B01','2/4/2016'),('M02','B02','3/3/2015'),('M03','B03','12/3/2018')

1.Cho bi?t danh sách thu?c c?a c?a hàng .
select *
from Thuoc;
2.Hi?n th? tên khách hàng không trùng.
select Distinct tenkh
from KhachHang;

3.Hi?n th? các khách hàng ? ??a ch? b?t ??u b?ng ch? N.
select *
from KhachHang
where diachi like 'H%';

4. Cho bi?t thông tin v? khách hàng c?a phi?u Xu?t trong tháng  2/2019.
select nhanvien.*
from nhanvien,phieunhap
where (month(ngaynhap)=2 and (year(ngaynhap)=2019) and (nhanvien.manv = phieunhap.manv));

5.Hi?n th? danh sách nhân viên. 
select *
from NhanVien;

6.Cho bi?t s? l??ng phi?u nh?p c?a mã nhân viên .
select manv as Tinh, count (*) as SL_PhieuNhap
from phieunhap
Group by manv;

7. Hi?n th? danh sách khách hàng.
select * 
from KhachHang;

8.Cho bi?t thu?c Csirt ???c hãng Melem s?n xu?t.
select * 
from hangsx,thuoc
where tenthuoc like'Csirt'and tenhang like 'Melem' ;

9.Li?t kê 2  nhà cc'Valus', 'Buld'
select top 2 manhacc,tennhacc
from nhacungcap
where manhacc like 'Valus''Buld';

10.Li?t kê ??y ?? thông tin v? hãng sx c?a công ty.
select *
from hangsx;

11.??a ra 2 tên thu?c, mã thu?c, công d?ng ??u tiên trong danh sách.
select top 2 tenthuoc,mathuoc,congdung
from Thuoc;

12. Hi?n th? danh sach Nhà cung c?p.
select *
from nhacungcap;

13.??a ra s? phi?u nh?p ???c nhân viên Nguy?n Thanh Nga ki?m tra.
select nhanvien.*
from phieunhap,nhanvien
where (nhanvien.manv = phieunhap.manv)and (hoten like  'Nguyen Thanh Nga');

14.Cho bi?t khách hàng ???c s?p x?p theo ??a ch?, n?u cùng ??a ch? thì gi?m d?n theo tên
select * 
from khachhang
order by diachi Asc, tenkh Desc;

15.Cho bi?t s? thu?c t?ng theo Hãng S?n xu?t
select  mahangsx, tenhang,quocgia
from hangsx
order by TenHang;