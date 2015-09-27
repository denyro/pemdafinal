# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150914075244) do

  create_table "agama", primary_key: "kode", force: true do |t|
    t.string "agama",      limit: 100, default: "", null: false
    t.string "keterangan"
  end

  create_table "dim", id: false, force: true do |t|
    t.string  "npm",               limit: 15,  default: "",  null: false
    t.string  "nama",              limit: 100, default: "",  null: false
    t.string  "jk",                limit: 1,   default: "",  null: false
    t.string  "tmp_lahir",         limit: 50
    t.date    "tgl_lahir"
    t.string  "alamat_asal",       limit: 200
    t.string  "kota_asal",         limit: 50
    t.integer "kdpos_alm_asal"
    t.string  "notlp_asal",        limit: 30
    t.string  "propinsi_asal",     limit: 50
    t.integer "agama",             limit: 1,   default: 0,   null: false
    t.string  "kewarganegaraan",   limit: 15,  default: "",  null: false
    t.integer "sts_sipil",         limit: 1,   default: 0,   null: false
    t.string  "gol_darah",         limit: 3
    t.integer "angkatan",          limit: 2,   default: 0,   null: false
    t.string  "jlr_msk",           limit: 25,  default: "",  null: false
    t.integer "jml_sdr_kandung",   limit: 1
    t.string  "prodi",             limit: 6,   default: "0", null: false
    t.integer "sts_awal",          limit: 1,   default: 0,   null: false
    t.integer "sts_mhs",           limit: 1,   default: 0,   null: false
    t.string  "kelas",             limit: 1,   default: "",  null: false
    t.string  "dosen_wali",        limit: 15,  default: ""
    t.integer "reg_pertama",       limit: 2
    t.date    "tgl_terdaftar"
    t.string  "sts_akhir",         limit: 2,   default: "",  null: false
    t.string  "no_hp",             limit: 15
    t.string  "email",             limit: 50
    t.string  "nama_kos",          limit: 100
    t.string  "alamat_kos",        limit: 200
    t.string  "kota_kos",          limit: 50
    t.string  "tlp_kos",           limit: 15
    t.string  "nama_ayah",         limit: 50
    t.string  "pend_ayah",         limit: 50
    t.string  "kerja_ayah",        limit: 50
    t.string  "sts_hdp_ayah",      limit: 1,   default: "H", null: false
    t.string  "nama_ibu",          limit: 50
    t.string  "pend_ibu",          limit: 50
    t.string  "kerja_ibu",         limit: 50
    t.string  "sts_hdp_ibu",       limit: 1,   default: "H", null: false
    t.integer "penghasilan_ortu"
    t.string  "alamat_ortu"
    t.string  "kota_ortu",         limit: 50
    t.integer "kdpos_ortu"
    t.string  "propinsi_ortu",     limit: 50
    t.string  "tlp_ortu",          limit: 50
    t.integer "anak_ke",           limit: 1
    t.string  "asal_sekolah",      limit: 50
    t.integer "thn_lulus_sekolah", limit: 2
    t.string  "no_sttb",           limit: 25
  end

  add_index "dim", ["agama"], name: "agama", using: :btree
  add_index "dim", ["jk"], name: "jk", using: :btree
  add_index "dim", ["jlr_msk"], name: "jlr_msk", using: :btree
  add_index "dim", ["kelas"], name: "kelas", using: :btree
  add_index "dim", ["kewarganegaraan"], name: "kewarganegaraan", using: :btree
  add_index "dim", ["prodi"], name: "prodi", using: :btree
  add_index "dim", ["sts_akhir"], name: "sts_akhir", using: :btree
  add_index "dim", ["sts_awal"], name: "sts_awal", using: :btree
  add_index "dim", ["sts_hdp_ayah"], name: "sts_hdp_ayah", using: :btree
  add_index "dim", ["sts_hdp_ibu"], name: "sts_hdp_ibu", using: :btree
  add_index "dim", ["sts_mhs"], name: "sts_mhs", using: :btree
  add_index "dim", ["sts_sipil"], name: "sts_sipil", using: :btree

  create_table "indonesia", force: true do |t|
    t.string "title"
  end

  create_table "prodi", primary_key: "kode", force: true do |t|
    t.string "kode_lama",     limit: 10
    t.string "nama_prodi",    limit: 100, default: "", null: false
    t.string "singkat_prodi", limit: 50
    t.string "gelar",         limit: 10
    t.string "keterangan"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "role"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
