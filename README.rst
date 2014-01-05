===============================
RoR RailsAdmin Backend Scaffold
===============================

**Gemfile**

	::

		gem 'rails_admin'
		gem 'carrierwave'


**Run Command Line**

	::

		# 其 devise Model Name 使用預設的就可以了
		# 基本上一路 Enter 即可。
			rails g rails_admin:install

		# 建立書庫範例, 展示 Carrierwave 部分
		# or rails g scaffold book label:string covery:string
		# 使用 Scaffold 可增加幾個 rails_admin 的頁面接口
			rails g model book label:string cover:string

		# 建立檔案上傳器
			rails generate uploader Avatar

		# app/models/books.rb
			class Book < ActiveRecord::Base
			  mount_uploader :cover, AvatarUploader
			  # 將上傳器綁定給 Book Model 的 Cover Field
			end

		# Data Migration
			bundle exec rake db:migrate

**Carrierwave Uploader 增加中文字支援**
	
	::

		# 參考：https://github.com/carrierwaveuploader/carrierwave
		# avatar_uploader.rb
			class AvatarUploader < CarrierWave::Uploader::Base
				...
				CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
				...
			end

		# 要注意它是 UTF-8 路徑與檔名, 所以 Windows 下最好不要開起中文路徑。
		# 因為 Windows 的文件名稱是 CP950。所以會顯示找不到檔案！
		# 否則一樣看不到檔案。


**登入後台並建立使用者**
	
	::

		# 訪問網址 /admin ( 先前 rails_admin:install 第一個問題 )
		# 使用 devise 介面點選 sign up 註冊一個管理員帳號


**複寫Rails Admin的介面**

	::

		# 根據 rails_admin 套件的目錄參考 /app/views/rails_admin/main/*
		# 以 haml 標記語言，並有以下文件：
			...
			index.html.haml			# 就是 list 的公版
			edit.html.haml
			new.html.haml
			show.html.haml
			...
			等等。

		# 在專案的 /app/views/rails_admin/main/ 位置建立你要複寫的模板即可！


**讓後台增加中文語系支援**

	::

		# 參考：https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/zh-TW.yml
		# 下載：zh-TW.yml http://github.com/svenfuchs/rails-i18n 到 config/locale/zh-TW.yml
		  下，就有預設的 Rails 繁體中文翻譯。

		# 參考：https://github.com/sferik/rails_admin/wiki/Translations
		# 下載 rails_admin.zh-TW.yml，並放到專案的 config/locales/rails_admin.zh-TW.yml
		# 在 application.rb 內設定語系
			module RoRRailsAdminScaffold
				class Application < Rails::Application
					...
					#config.i18n.default_locale = :da
					# 增加這一行
					config.i18n.default_locale = 'zh-TW'
					...
				end
			end


**問題排除**

	:: 

		1.要注意安裝順序，有時候安裝順序不對會出現一些BUG。
		2.如果出現 undefined gsub method miss 等訊息就重裝吧！
		3.也可以考慮根據 Console 的 Error 訊息去增加 gsub 方法。