<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<style>

.topbar2
{
	background-color: <?=$this->config->item('header_color', "{$theme}_theme");?>; /*#ad946a*/
}

.gold
{
	color: <?=$this->config->item('search_button_color', "{$theme}_theme");?>;
}

.btn-gold
{
  color: #fff;
  background-color: <?=$this->config->item('search_button_color', "{$theme}_theme");?>;
  border-color: <?=$this->config->item('search_button_color', "{$theme}_theme");?>;
}
.btn-gold:focus,
.btn-gold.focus {
  color: #fff;
  background-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
  border-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
}
.btn-gold:hover {
  color: #fff;
  background-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
  border-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
}
.btn-gold:active,
.btn-gold.active,
.open > .dropdown-toggle.btn-gold {
  color: #fff;
  background-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
  border-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
}
.btn-gold:active:hover,
.btn-gold.active:hover,
.open > .dropdown-toggle.btn-gold:hover,
.btn-gold:active:focus,
.btn-gold.active:focus,
.open > .dropdown-toggle.btn-gold:focus,
.btn-gold:active.focus,
.btn-gold.active.focus,
.open > .dropdown-toggle.btn-gold.focus {
  color: #fff;
  background-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
  border-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
}
.btn-gold:active,
.btn-gold.active,
.open > .dropdown-toggle.btn-gold {
  background-image: none;
}
.btn-gold.disabled:hover,
.btn-gold[disabled]:hover,
fieldset[disabled] .btn-gold:hover,
.btn-gold.disabled:focus,
.btn-gold[disabled]:focus,
fieldset[disabled] .btn-gold:focus,
.btn-gold.disabled.focus,
.btn-gold[disabled].focus,
fieldset[disabled] .btn-gold.focus {
  background-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
  border-color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
}
.btn-gold .badge {
  color: <?=$this->config->item('search_button_hover_color', "{$theme}_theme");?>;
  background-color: #fff;
}

</style>
