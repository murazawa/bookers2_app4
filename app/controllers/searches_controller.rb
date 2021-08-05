class SearchesController < ApplicationController
  
  def search
    @model = params["search"]["model"] #選択したmodelを@modelに代入
    @value = params["search"]["value"] #検索にかけた文字列(ここではvalue)を@valueに代入
    @how = params["search"]["how"]     #選択した検索方法howを@howに代入
    @datas = search_for(@how, @model, @value) #search_forの引数にインスタンス変数を定義
  end #@datasに最終的な検索結果が入ります

  private
  
  def match(model, value)
    #def search_forでhowがmatchだった場合の処理
    #modelがuserの場合の処理
    #whereでvalueと完全一致するnameを探します
    if model == 'user'
      User.where(name: value)
    elsif model == 'book'
      Book.where(title: value)
    end
  end
  
  def forward(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "%##{value}%")
    end
  end
  
  def backward(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{value}%")
    end
  end

  def partical(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{value}%")
    end
  end
  
  def search_for(how, model, value)
    case how
    when 'match'
      match(model,value)
    when 'forward'
         forward(model, value)
    when 'backward'
      backward(model, value)
    when 'partical'
      partical(model, value)
      
    end
  end
  #searchアクションで定義した情報が引数に入っている
  #検索方法のhowの中身がどれなのかwhenの条件分岐の中から探す処理
  #検索方法の引数に(model, value)を定義している
  #例えばhowがmatchの場合は def match の処理に進みます

  
end

# 前方一致
# モデル名.where("カラム名 LIKE ?", "値%")
# 後方一致
# モデル名.where("カラム名 LIKE ?", "%値")
# 部分一致
# モデル名.where("カラム名 LIKE ?", "%値%")
