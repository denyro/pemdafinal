class SosialController < ApplicationController
before_filter :authenticate_user

  def authenticate_user
    if current_user.nil? || (current_user.role!=0)
      flash[:error] = 'You must be signed in as admin to view that page.'
      redirect_to :controller => 'authentication' , :action => 'sign_in'
	else
	  flash[:notice] = 'Welcome ' + current_user.username
	end
  end
  
  def demografi
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@dataArea = client.query("SELECT * FROM indonesia")
  end
  
  def agama
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@dataAgama = client.query("SELECT a.agama, count(a.agama) as jumlah 
								FROM dim d LEFT JOIN agama a ON a.kode = d.agama
								GROUP BY a. agama")
	@dataMapAgama = client.query("SELECT a.agama,
									sum(case when d.propinsi_asal='ID-AC' then 1 else 0 end) AS 'ID-AC',
									sum(case when d.propinsi_asal='ID-BA' then 1 else 0 end) AS 'ID-BA',
									sum(case when d.propinsi_asal='ID-BB' then 1 else 0 end) AS 'ID-BB',
									sum(case when d.propinsi_asal='ID-BE' then 1 else 0 end) AS 'ID-BE',
									sum(case when d.propinsi_asal='ID-BT' then 1 else 0 end) AS 'ID-BT',
									sum(case when d.propinsi_asal='ID-GO' then 1 else 0 end) AS 'ID-GO',
									sum(case when d.propinsi_asal='ID-JA' then 1 else 0 end) AS 'ID-JA',
									sum(case when d.propinsi_asal='ID-JB' then 1 else 0 end) AS 'ID-JB',
									sum(case when d.propinsi_asal='ID-JI' then 1 else 0 end) AS 'ID-JI',
									sum(case when d.propinsi_asal='ID-JK' then 1 else 0 end) AS 'ID-JK',
									sum(case when d.propinsi_asal='ID-JT' then 1 else 0 end) AS 'ID-JT',
									sum(case when d.propinsi_asal='ID-KB' then 1 else 0 end) AS 'ID-KB',
									sum(case when d.propinsi_asal='ID-KI' then 1 else 0 end) AS 'ID-KI',
									sum(case when d.propinsi_asal='ID-KR' then 1 else 0 end) AS 'ID-KR',
									sum(case when d.propinsi_asal='ID-KS' then 1 else 0 end) AS 'ID-KS',
									sum(case when d.propinsi_asal='ID-KT' then 1 else 0 end) AS 'ID-KT',
									sum(case when d.propinsi_asal='ID-KU' then 1 else 0 end) AS 'ID-KU',
									sum(case when d.propinsi_asal='ID-LA' then 1 else 0 end) AS 'ID-LA',
									sum(case when d.propinsi_asal='ID-MA' then 1 else 0 end) AS 'ID-MU',
									sum(case when d.propinsi_asal='ID-MU' then 1 else 0 end) AS 'ID-MU',
									sum(case when d.propinsi_asal='ID-NB' then 1 else 0 end) AS 'ID-NB',
									sum(case when d.propinsi_asal='ID-NT' then 1 else 0 end) AS 'ID-NT',
									sum(case when d.propinsi_asal='ID-PA' then 1 else 0 end) AS 'ID-PA',
									sum(case when d.propinsi_asal='ID-PB' then 1 else 0 end) AS 'ID-PB',
									sum(case when d.propinsi_asal='ID-RI' then 1 else 0 end) AS 'ID-RI',
									sum(case when d.propinsi_asal='ID-SA' then 1 else 0 end) AS 'ID-SA',
									sum(case when d.propinsi_asal='ID-SB' then 1 else 0 end) AS 'ID-SB',
									sum(case when d.propinsi_asal='ID-SG' then 1 else 0 end) AS 'ID-SG',
									sum(case when d.propinsi_asal='ID-SN' then 1 else 0 end) AS 'ID-SN',
									sum(case when d.propinsi_asal='ID-SR' then 1 else 0 end) AS 'ID-SR',
									sum(case when d.propinsi_asal='ID-SS' then 1 else 0 end) AS 'ID-SS',
									sum(case when d.propinsi_asal='ID-ST' then 1 else 0 end) AS 'ID-ST',
									sum(case when d.propinsi_asal='ID-SU' then 1 else 0 end) AS 'ID-SU',
									sum(case when d.propinsi_asal='ID-YO' then 1 else 0 end) AS 'ID-YO'
									from dim d
									LEFT JOIN agama a ON d.agama = a.kode
									group by a.agama")							
  end
  
  def pendidikan
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@dataprodi = client.query("select angkatan, sum(case when prodi='140003' then 1 else 0 end) as Geofis, 
									sum(case when prodi='140103' then 1 else 0 end) as MI,
									sum(case when prodi='140203' then 1 else 0 end) as TI,
									sum(case when prodi='140303' then 1 else 0 end) as TK,
									sum(case when prodi='140403' then 1 else 0 end) as IE,
									sum(case when prodi='140503' then 1 else 0 end) as KI,
									sum(case when prodi='140603' then 1 else 0 end) as KA
								from dim
								group by angkatan")
	@dataMapProdi = client.query("SELECT p.nama_prodi,
							sum(case when d.propinsi_asal='ID-AC' then 1 else 0 end) AS 'ID-AC',
							sum(case when d.propinsi_asal='ID-BA' then 1 else 0 end) AS 'ID-BA',
							sum(case when d.propinsi_asal='ID-BB' then 1 else 0 end) AS 'ID-BB',
							sum(case when d.propinsi_asal='ID-BE' then 1 else 0 end) AS 'ID-BE',
							sum(case when d.propinsi_asal='ID-BT' then 1 else 0 end) AS 'ID-BT',
							sum(case when d.propinsi_asal='ID-GO' then 1 else 0 end) AS 'ID-GO',
							sum(case when d.propinsi_asal='ID-JA' then 1 else 0 end) AS 'ID-JA',
							sum(case when d.propinsi_asal='ID-JB' then 1 else 0 end) AS 'ID-JB',
							sum(case when d.propinsi_asal='ID-JI' then 1 else 0 end) AS 'ID-JI',
							sum(case when d.propinsi_asal='ID-JK' then 1 else 0 end) AS 'ID-JK',
							sum(case when d.propinsi_asal='ID-JT' then 1 else 0 end) AS 'ID-JT',
							sum(case when d.propinsi_asal='ID-KB' then 1 else 0 end) AS 'ID-KB',
							sum(case when d.propinsi_asal='ID-KI' then 1 else 0 end) AS 'ID-KI',
							sum(case when d.propinsi_asal='ID-KR' then 1 else 0 end) AS 'ID-KR',
							sum(case when d.propinsi_asal='ID-KS' then 1 else 0 end) AS 'ID-KS',
							sum(case when d.propinsi_asal='ID-KT' then 1 else 0 end) AS 'ID-KT',
							sum(case when d.propinsi_asal='ID-KU' then 1 else 0 end) AS 'ID-KU',
							sum(case when d.propinsi_asal='ID-LA' then 1 else 0 end) AS 'ID-LA',
							sum(case when d.propinsi_asal='ID-MA' then 1 else 0 end) AS 'ID-MU',
							sum(case when d.propinsi_asal='ID-MU' then 1 else 0 end) AS 'ID-MU',
							sum(case when d.propinsi_asal='ID-NB' then 1 else 0 end) AS 'ID-NB',
							sum(case when d.propinsi_asal='ID-NT' then 1 else 0 end) AS 'ID-NT',
							sum(case when d.propinsi_asal='ID-PA' then 1 else 0 end) AS 'ID-PA',
							sum(case when d.propinsi_asal='ID-PB' then 1 else 0 end) AS 'ID-PB',
							sum(case when d.propinsi_asal='ID-RI' then 1 else 0 end) AS 'ID-RI',
							sum(case when d.propinsi_asal='ID-SA' then 1 else 0 end) AS 'ID-SA',
							sum(case when d.propinsi_asal='ID-SB' then 1 else 0 end) AS 'ID-SB',
							sum(case when d.propinsi_asal='ID-SG' then 1 else 0 end) AS 'ID-SG',
							sum(case when d.propinsi_asal='ID-SN' then 1 else 0 end) AS 'ID-SN',
							sum(case when d.propinsi_asal='ID-SR' then 1 else 0 end) AS 'ID-SR',
							sum(case when d.propinsi_asal='ID-SS' then 1 else 0 end) AS 'ID-SS',
							sum(case when d.propinsi_asal='ID-ST' then 1 else 0 end) AS 'ID-ST',
							sum(case when d.propinsi_asal='ID-SU' then 1 else 0 end) AS 'ID-SU',
							sum(case when d.propinsi_asal='ID-YO' then 1 else 0 end) AS 'ID-YO'
							from dim d
							LEFT JOIN prodi p ON d.prodi = p.kode
							group by p.nama_prodi")
  end
  
  def kesehatan
  end
  
  def pidana
  end
  
end
