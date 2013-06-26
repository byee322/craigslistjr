get '/' do
	@categories = Category.all
	erb :index
end

get '/get_category' do 
	p @category = params[:categoryname]
	@posts = Category.find_by_categoryname(@category).posts
	erb :show_category
end

post '/post_listing' do 
	p @category = Category.find_or_create_by_categoryname(params[:category])
	p @post = Post.find_or_create_by_title(params[:title])
	@post.category_id = @category.id
	@post.description = params[:description]
	@post.save
	redirect "/get_category?categoryname=#{@category.categoryname}"
end

get '/:category_id' do

end