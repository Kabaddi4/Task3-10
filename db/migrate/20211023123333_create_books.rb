class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      #課題のカラムを記載
      t.string :title
      t.string :body
      t.string :user_image#画像を扱うカラムの型。なんぞや？？ 10/23→stringが適切らしいのでそれで試してみる

      t.timestamps
    end
  end
end
