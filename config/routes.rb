Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
    #dashboard
    get 'dashboard' => 'dashboard#index'
	get 'dashboard/terkini' => 'dashboard#terkini'
	
	#Utama
	get 'dashboard/utama/ekonomi' => 'utama#pendidikan'
    get 'dashboard/utama/sosial' => 'utama#sosial'
	get 'dashboard/utama/kesehatan' => 'utama#kesehatan'
	get 'dashboard/utama/pendidikan' => 'utama#pendidikan'
	get 'dashboard/utama/transportasi' => 'utama#transportasi'
	get 'dashboard/utama/LH' => 'utama#LH'
	
	#SKPD
	get 'dashboard/SKPD/Pendidikan' => 'utama#pendidikan'
    get 'dashboard/SKPD/dukpacil' => 'utama#sosial'
	get 'dashboard/SKPD/pertanian' => 'utama#kesehatan'
	get 'dashboard/SKPD/kominfo' => 'utama#pendidikan'
	get 'dashboard/SKPD/pertamanan' => 'utama#transportasi'
	get 'dashboard/SKPD/tenagakerja' => 'utama#LH'
	get 'dashboard/SKPD/kesehatan' => 'dashboard#index'
	get 'dashboard/SKPD/Perdagangan' => 'dashboard#terkini'
	get 'dashboard/SKPD/BinaMarga' => 'dashboard#index'
	get 'dashboard/SKPD/PemudaOR' => 'dashboard#terkini'
	
	#LKP
	get 'dashboard/LKP/LAKIP' => 'utama#pendidikan'
    get 'dashboard/LKP/LKPJ' => 'utama#sosial'
	get 'dashboard/LKP/LPPD' => 'utama#kesehatan'
	get 'dashboard/LKP/EKPPD' => 'utama#pendidikan'
	get 'dashboard/LKP/ILPPD' => 'utama#transportasi'
	get 'dashboard/LKP/RPJMD' => 'utama#LH'
	
	#IKU
	get 'dashboard/IKU/IPM' => 'utama#pendidikan'
    get 'dashboard/IKU/IKK' => 'utama#sosial'
	get 'dashboard/IKU/IKM' => 'utama#kesehatan'
	get 'dashboard/IKU/IKRataan' => 'utama#pendidikan'
	get 'dashboard/IKU/IKRasio' => 'utama#transportasi'
	
	#internal
	get 'dashboard/internal/kehadiran' => 'utama#pendidikan'
    get 'dashboard/internal/PNS' => 'utama#sosial'
	get 'dashboard/internal/serapan' => 'utama#kesehatan'
	
	#Admin
	get 'admin' => 'admin#admin'
	get 'admin/insert' => 'admin#insert'
	get 'admin/dim' => 'admin#dim'
	get 'admin/prodi' => 'admin#prodi'
	get 'admin/agama' => 'admin#agama'
	get 'admin/gol' => 'admin#gol'
	
	get 'admin/dim/new_data' => 'admin#newdim'
	post 'admin/dim/new_data' => 'admin#insertdim'
	
	get 'admin/prodi/new_prodi' => 'admin#newprodi'
	post 'admin/prodi/new_prodi' => 'admin#insertprodi'
  
	#Authentication
    get 'sign_in' => 'authentication#sign_in'
	post 'sign_in' => 'authentication#login'
	get 'signed_out' => 'authentication#signed_out'
	


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
