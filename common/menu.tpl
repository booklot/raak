<div id="viewport" class="hidden">
<a id="close_menu" onclick="remove_viewport()" ></a>
	
	<header>
		<h1>Start</h1>
		
		<?php $attr = array(  'method'=>'get', 'id'=>'menu_search' );
		echo form_open( current_url(), $attr );?>
			<input type="search" class="menusearch" name="menusearch" placeholder="search" onchange="menu_search()" value="" required>
			<input type="submit" name="search" value=" ">
		</form>
	</header>
	
	<section>
	<div id="your-div-id" class="flexcroll" style="overflow:auto;height:100%;">
	<ul id="window_menu">
		<!-- -->
			<fieldset>
		<!-- -->
		<li class="blue"><span>Home</span></li>
		<li class="purple"><span>About Us</span></li>
		<li class="red"><span>Advertising</span></li>
		<li class="skyblue"><span>Help</span></li>
		<li class="green"><span>Contact</span></li>
		<li class="gray"><span>Preferences</span></li>
		<li class="green"><span>Contact</span></li>
		<!-- -->
			</fieldset>
					<fieldset>
		<!-- -->
		<li class="purple"><span>About Us</span></li>
		<li class="gray"><span>Preferences</span></li>
		<li class="red"><span>Advertising</span></li>
		<li class="skyblue"><span>Help</span></li>
		<li class="green"><span>Contact</span></li><li class="blue"><span>Home</span></li>
		<li class="purple"><span>About Us</span></li>
		<!-- -->
			</fieldset>
					<fieldset>
		<!-- -->
		<li class="gray"><span>Preferences</span></li>
		<li class="red"><span>Advertising</span></li>
		<li class="skyblue"><span>Help</span></li>
		<li class="green"><span>Contact</span></li><li class="blue"><span>Home</span></li>
		<li class="purple"><span>About Us</span></li>
		<li class="red"><span>Advertising</span></li>
		<!-- -->
			</fieldset>
					<fieldset>
		<!-- -->
		<li class="green"><span>Contact</span></li><li class="blue"><span>Home</span></li>
		<li class="purple"><span>About Us</span></li>
		<li class="red"><span>Advertising</span></li>
		<li class="skyblue"><span>Help</span></li>
		<li class="green"><span>Contact</span></li><li class="blue"><span>Home</span></li>
		
		<!-- -->
			</fieldset>
					<fieldset>
		<!-- -->
		<li class="skyblue"><span>Help</span></li>
		<li class="purple"><span>About Us</span></li>
		<li class="red"><span>Advertising</span></li>
		
		</fieldset>
	</ul></div>
	</section>
</div>
