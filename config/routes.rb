# encoding:utf-8

RoRRailsAdminScaffold::Application.routes.draw do
  # 指定 Scaffod API, 並起設定預設的回覆就是 JSON
  resources :todo3s, :defaults=>{format: :json}
  # Ajax CRUD 範例：
  #   create
  #     $.ajax({
  #       url:'/todo3s',
  #       type:'post',
  #       data:{
  #         todo3:{
  #           label:'created by ajax'
  #         }
  #       },
  #       dataType:'json',
  #       success:function(res,status,xhr){
  #         console.log(res);
  #       }
  #     });
  #
  #   delete
  #     $.ajax({url:'/todo3s/1.json',type:'delete',dataType:'json',success:function(res,status,xhr){console.log(res);}});

  #   put
  #     $.ajax({url:'/todo3s/3.json',type:'put',data:{todo3:{label:'ajax put modify'}},dataType:'json',success:function(res,status,xhr){console.log(res);}});
  #     

  #   delete
  #     $.ajax({url:'/todo3s/6.json',type:'delete',dataType:'json',success:function(res,status,xhr){console.log(res);}});


  # 參考：http://api.rubyonrails.org/classes/ActionDispatch/Routing/Mapper/Resources.html
  # 使用 only option 設定只允許 :index 與 :show Action
  resources :todos, :only=>[:index,:show]
  # 將 todo 修改為 JSON API
  # namespace :todos do
    # get 'index'
    # get 'show'
  # end


  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
