CREATE database SUPERINDO;
use superindo;

-- DDL
create table kasir (
Id_kasir char (6),
Nama_Kasir varchar (30),
No_HP varchar (15),
Jabatan varchar (20),
primary key (Id_kasir)
);

create table supplier (
id_supplier char (5),
supplier varchar (20),
nama_supplier varchar (30),
telp_supplier varchar (15),
alamat_supplier varchar (50),
primary key (id_supplier)
);

create table barang (
kode_barang char (6),
nama_barang varchar (30) not null,
jenis_barang varchar (20),
harga_barang numeric (10,2),
tanggal_produksi date,
expired date,
stok int,
id_supplier char (5),
primary key (kode_barang),
foreign key (id_supplier) references supplier(id_supplier)
);

create table transaksi (
id_transaksi char (6),
no_transaksi varchar (20),
Id_kasir char (6),
total_item int,
total_tagihan numeric (10,2),
total_kembalian numeric (10,2),
primary key (id_transaksi),
foreign key (Id_kasir) references kasir(Id_kasir)
);

create table detail_transaksi (
id_detail char (5),
id_transaksi char (6),
kode_barang char (6),
jumlah_barang int,
harga_barang numeric (10,2),
total_tagihan numeric (10,2),
primary key (id_detail),
foreign key (id_transaksi) references transaksi(id_transaksi),
foreign key (kode_barang) references barang(kode_barang)
);

show tables;
describe barang;
describe supplier;
describe kasir;
describe transaksi;
describe detail_transaksi;

-- DML
insert into supplier values
('SP001','INDOFD','JOKO SUSILO','8956666666','JL.MANGGIS'),
('SP002','GARUDAFD','SUPRATNO','8977777777','JL.KACANG');

select * from supplier;

insert into kasir values
('KSR001','Santi','8999999999','Junior'),
('KSR002','Yani','8977777777','Senior');

select * from kasir;

insert into barang values
('BR001','Nissin Sandwich Coklat','Makanan',7900,'2024-10-15','2026-10-15',1200,'SP001'),
('BR002','Wow Spaghetti','Makanan',3190,'2025-05-20','2025-11-20',500,'SP001'),
('BR003','Emperial','Makanan',5900,'2025-06-11','2025-11-11',750,'SP001'),
('BR004','Aoki Coklat','Makanan',2500,'2025-11-15','2026-05-21',1000,'SP002');

select * from barang;

insert into transaksi values
('TR001','167-19/10/2025','KSR001',1,7900,12100),
('TR002','168-19/10/2025','KSR001',1,3190,16810),
('TR003','169-19/10/2025','KSR002',1,5900,14100);

select * from transaksi;

insert into detail_transaksi values
('DT001','TR001','BR001',1,7900,7900),
('DT002','TR002','BR002',1,3190,3190),
('DT003','TR002','BR003',1,5900,5900);

select * from detail_transaksi;

update barang
set stok = 1000
where kode_barang = 'BR001';

select * from barang;

select stok from barang
where kode_barang = 'BR001' ;

select nama_barang,harga_barang
from barang 
where harga_barang > 5000;

select nama_barang,stok
from barang
where stok > 500;

-- where 
select * from barang 
where jenis_barang='makanan';

-- distinct
select distinct jenis_barang
from barang;

-- order by
select nama_barang,harga_barang
from barang
order by harga_barang asc;

-- limit
select * from barang
limit 2;

-- like
select * from barang
where nama_barang like 'Emperial';

-- between 
select * from barang
where harga_barang between 3000 and 8000;

-- in 
select * from barang
where kode_barang in ('BR001','BR003');

-- alias 
select nama_barang as nama,harga_barang as harga from barang;

-- agregat 
select count(kode_barang) as jumlah_barang
from barang;
select sum(harga_barang) as total_harga
from barang;

-- group by
select jenis_barang,count(kode_barang) as jumlah
from barang
group by jenis_barang;

select jenis_barang,count(kode_barang) as jumlah
from barang
group by jenis_barang
having count(kode_barang) > 1;

-- inner joint
select
transaksi.no_transaksi,
kasir.nama_kasir,
barang.nama_barang,
detail_transaksi.jumlah_barang,
detail_transaksi.total_tagihan
from detail_transaksi 
join transaksi
	on detail_transaksi.id_transaksi = transaksi.id_transaksi
join kasir
	on transaksi.id_kasir = kasir.id_kasir
join barang
	on detail_transaksi.kode_barang=barang.kode_barang;
    
-- left join
select 
barang.nama_barang,
supplier.nama_supplier
from barang
left join supplier
on barang.id_supplier = supplier.id_supplier;

-- right join
select
barang.nama_barang,
supplier.nama_supplier
from barang
right join supplier
on barang.id_supplier = supplier.id_supplier;

-- full outer join
select
barang.nama_barang,
supplier.nama_supplier
from barang
left join supplier
on barang.id_supplier = supplier.id_supplier
union
select 
barang.nama_barang,
supplier.nama_supplier
from barang
right join supplier
on barang.id_supplier = supplier.id_supplier;

-- TCL : Transaksi Penjualan
start transaction;

insert into transaksi values
('TR008','174-19/10/2025','KSR001',1,7900,12100);

insert into detail_transaksi values
('DT008','TR008','BR001',1,7900,7900);

update barang
set stok = stok -1
where kode_barang = 'BR001';

commit;

-- sub query
select nama_barang, harga_barang
from barang
where harga_barang > (
select avg(harga_barang) from barang
);
 -- view
 create view view_transaksi as 
 select 
 transaksi.no_transaksi,
 kasir.nama_kasir,
 barang.nama_barang,
 detail_transaksi.jumlah_barang,
 detail_transaksi.total_tagihan
 from detail_transaksi
 join transaksi on detail_transaksi.id_transaksi = transaksi.id_transaksi	
 join kasir on transaksi.id_kasir = kasir.id_kasir
 join barang on detail_transaksi.kode_barang = barang.kode_barang;
