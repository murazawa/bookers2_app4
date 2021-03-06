class SearchesController < ApplicationController

  def index
    @model = params["search"]["model"] 
    @value = params["search"]["value"] 
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @value) 
    # binding.pry
  end 
  
  private

  def match(model, value)
    
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
