class SearchesController < ApplicationController
  
  def search
    
  end
  
  
end

# 前方一致
# モデル名.where("カラム名 LIKE ?", "値%")
# 後方一致
# モデル名.where("カラム名 LIKE ?", "%値")
# 部分一致
# モデル名.where("カラム名 LIKE ?", "%値%")
