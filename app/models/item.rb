class Item < ActiveRecord::Base
  serialize :raw_info , Hash

  has_many :ownerships  , foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships

  #below lines add L8.6.7
  has_many :wants,class_name:"Want",foreign_key:"item_id" , dependent: :destroy
  #外部キーが使われているときは、外部キーの削除に連動させるため基本的にdependent:   :destroyもつける
  #typeがWantである行の集まりを仮のテーブルwants want_usersとの仮想的な中間テーブルとなる
  has_many :want_users,through: :wants,source: :user
  has_many :haves,class_name:"Have",foreign_key:"item_id" , dependent: :destroy
  #外部キーが使われているときは、外部キーの削除に連動させるため基本的にdependent:   :destroyもつける
  #typeがHaveであるものの一覧がhaves ,have_usersとの仮想的な中間テーブルとなる
  has_many :have_users,through: :haves,source: :user

  #above lines add L8.6.7
end
