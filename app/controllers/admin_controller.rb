class AdminController < ApplicationController
before_filter :authenticate_user, :except => [:insertdim, :insertprodi]

  def authenticate_user
    if current_user.nil? || (current_user.role!=0 && current_user.role!=1)
      flash[:error] = 'You must be signed in as admin to view that page.'
      redirect_to :controller => 'authentication' , :action => 'sign_in'
	else
	  flash[:notice] = 'Welcome ' + current_user.username
	end
  end
  
  def admin
  end
  
  def dim
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@dim = client.query("select d.npm, d.nama, d.jk, i.title as propinsi, p.nama_prodi as prodi, d.gol_darah 
							from dim d
							left join prodi p on d.prodi = p.kode 
							left join indonesia i on d.propinsi_asal = i.id")
  end
  
  def newdim
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@datapropinsi = client.query("select * from indonesia")
	@dataagama = client.query("select * from agama")
	@dataprodi = client.query("select * from prodi")	
  end

  def insertdim
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@npm = params[:npm]
	@nama = params[:nama]
	@agama = params[:agama]
	@lahir = params[:lahir]
	@angkatan = params[:angkatan]
	@prop = params[:prop]
	@gol = params[:gol]
	@jk = params[:jk]
	@prodi = params[:prodi]
	@diminsert = client.query("INSERT INTO dim (npm,nama,jk,tgl_lahir,propinsi_asal,agama,angkatan,prodi,gol_darah)  
									VALUES 
									('#{@npm}','#{@nama}','#{@jk}','#{@lahir}','#{@prop}',#{@agama},
									#{@angkatan},'#{@prodi}','#{@gol}')
							")
	@dim = client.query("select d.npm, d.nama, d.jk, i.title as propinsi, p.nama_prodi as prodi, d.gol_darah 
							from dim d
							left join prodi p on d.prodi = p.kode 
							left join indonesia i on d.propinsi_asal = i.id")
	redirect_to :controller => "admin", :action => "dim"
  end
  
  def prodi
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@prodi = client.query("select * from prodi")
  end
 
  def newprodi

  end
   
  def insertprodi
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@kode = params[:kode]
	@newprodi = params[:prodi]
	@prodiinsert = client.query("INSERT INTO prodi (kode,nama_prodi) VALUES (#{@kode},'#{@newprodi}')")
	@prodi = client.query("select * from prodi")
	redirect_to :controller => "admin", :action => "prodi"
  end
  
  def agama
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@agama = client.query("select * from agama")
  end
  
  def gol
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
	@gol = client.query("select * from prodi")
  end
  
 
  

  

  

end
