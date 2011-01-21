# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110119221200) do

  create_table "ceps", :force => true do |t|
    t.string   "cep"
    t.string   "logradouro"
    t.string   "bairro"
    t.string   "localidade"
    t.string   "uf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ceps", ["cep"], :name => "index_ceps_on_cep", :unique => true

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["locked_by"], :name => "delayed_jobs_locked_by"
  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "downloads", :force => true do |t|
    t.integer  "edital_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "downloads", ["edital_id"], :name => "index_downloads_on_edital_id"
  add_index "downloads", ["user_id"], :name => "index_downloads_on_user_id"

  create_table "editals", :force => true do |t|
    t.integer  "numero_licitacao"
    t.integer  "ano_licitacao"
    t.integer  "modalidade_id"
    t.string   "titulo"
    t.text     "descricao"
    t.text     "aviso"
    t.date     "data_publicacao"
    t.datetime "data_abertura"
    t.boolean  "publicado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "edital_file_name"
    t.string   "edital_content_type"
    t.integer  "edital_file_size"
    t.datetime "edital_updated_at"
  end

  add_index "editals", ["descricao"], :name => "index_editals_on_descricao"
  add_index "editals", ["id"], :name => "index_editals_on_id"

  create_table "impugnations", :force => true do |t|
    t.integer  "edital_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.text     "post"
    t.integer  "edital_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modalidades", :force => true do |t|
    t.integer  "codigo"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.integer  "edital_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",          :default => false
    t.string   "cnpj_cpf"
    t.string   "razao_social"
    t.string   "fone"
    t.string   "fax"
    t.string   "contato"
    t.string   "cep"
    t.string   "logradouro"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.string   "inscr_estatual"
  end

  add_index "users", ["cnpj_cpf"], :name => "index_users_on_cnpj_cpf", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id"], :name => "index_users_on_id"
  add_index "users", ["username"], :name => "index_users_on_username"

end
