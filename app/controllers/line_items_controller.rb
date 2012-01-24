class LineItemsController < ApplicationController
before_filter :authenticate

#skip_before_filter :authorize, :only => :create
  # GET /line_items
  # GET /line_items.xml
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.xml
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.xml
  def new
  @line_item = LineItem.new
  @product = Product.find(params[:product_id])
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
    @product_id = @line_item.product_id
    @product = Product.find(@product_id)
  end

  # POST /line_items
  # POST /line_items.xml
  def create
   @user = current_user
   @cart = current_cart
  @line_item = @cart.line_items.new(params[:line_item])
    # product = Product.find(params[:product_id])
    # @line_item = @cart.add_product(product.id)
    

    respond_to do |format|
      if @line_item.save
          if @line_item.domain == "new"
              r = Whois.whois(@line_item.domain_name)
                  if r.available?
                    format.html {redirect_to cart_path(@cart)}
                 else
                     format.html {redirect_to edit_line_item_path(@line_item), :notice => 'Sorry, this domain name is not available'}
                  end
            end
      format.html {redirect_to cart_path(@cart)}
# if user = User.authenticate(params[:name], params[:password])
    # format.html { redirect_to @line_item.cart}
     # format.html { redirect_to new_user_registration_path}
       # format.html { redirect_to( :root ) }
       # format.js   { @current_item = @line_item }
        format.xml  { render :xml => @line_item,
         :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors,
        :status => :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.xml
  def update
    @cart = current_cart
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
           if @line_item.domain == "new"
             r = Whois.whois(@line_item.domain_name)
              if r.available?
                format.html { redirect_to cart_path(@cart) }
                format.xml  { head :ok }
              else
                format.html { redirect_to edit_line_item_path(@line_item), :notice => 'Sorry, this domain name is not available' }
                format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
            end
            end
      format.html { redirect_to cart_path(@cart) }
      else
        format.html { redirect_to edit_line_item_path(@line_item) } 
       end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(line_items_url) }
      format.xml  { head :ok }
    end
  end

private

def authenticate
  deny_access unless signed_in?
end

end
