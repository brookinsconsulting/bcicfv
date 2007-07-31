{set-block scope=root variable=cache_ttl}0{/set-block}
{* Feedback form - Full view *}
<a name="form_top"></a>
<link rel="stylesheet" type="text/css" href={"stylesheets/mwshop.css"|ezdesign} />
<script language="JavaScript" type="text/javascript" src={"javascript/useful.js"|ezdesign}></script>
<script language="JavaScript" type="text/javascript" src={"javascript/validation.js"|ezdesign}></script>
{def $attribs=array('accept_cc','need_equip','monthly_charges','average_charge','likely_method')}

{if ezhttp('from_little_form')}
		{if or( eq( ezhttp('accept_cc'), '' ), 
			 eq( ezhttp('need_equip'), '' ), 
			      eq( ezhttp('monthly_charges'), '' ) )}
			{def $partial_form=true}
		{else}
			{def $partial_form=false}
		{/if}
	    {def $supress_validation=true}
 	{else}
	    {def $supress_validation=false}
	    {def $partial_form=true}
	{/if}

	  {def $thehttp=ezhttp()}
	  {def $http_post=$thehttp.post}
	  {def $http_post_count=count( $thehttp.post )}

	  {if gt($http_post_count, 3)}
		{def $server_validation=1}
	  {else}
		{def $server_validation=0}
	  {/if}


	  {* def $foobar=ezhttp()}
	  {$foobar.post|attribute(show,1) *}
	  {* def $foobar=ezhttp()}
          {$foobar|attribute(show,1) *}



{if eq( ezhttp('from_little_form'), false() )}
{def $option_question_answered=false}
{foreach $attribs as $a}
  {let adm=$node.object.data_map.$a}
  {let l_checked_id=ezhttp( $adm )}

  {let ol=$adm.content.option_list}

  {let option_id=cond( and( is_set( $l_checked_id ), is_numeric( $l_checked_id ) ), $l_checked_id, 
       and( is_set( $#collection_attributes[$adm.id] ), 
	 	is_numeric( $#collection_attributes[$adm.id].data_int ) ), 
	$#collection_attributes[$adm.id].data_int, '--NONE--' )}
{*
	OptionName: {$a} <br />
	OptionID: {$option_id} <hr />
*}
{if ne( $option_id, '--NONE--' )}
    {def $option_question_answered=true}
{*
    <br />
    !! OptionID: {$option_id} <hr />
    ERROR: {if eq( $option_question_answered, 'true' )}<h1>display:block|{$option_question_answered}</h1>{else}<strike>display:none|{$option_question_answered}</strike>{/if}
*}

{/if}



  {* $ol|attribute(show,2) *}
  {* section show=$ol}
    {section var=PreOptions loop=$ol}
      PreOptions: {$PreOptions.item.id}<hr />
      {section show=and( $option_id|eq( '--NONE--'), $PreOptions.item.id|ne( $option_id ))}

{if }
       {def $option_question_answered=true()}
       {def $option_question_answered=true()}
{/if}

      {/section}{/section}{/section *}


{* <b>{$adm|attribute(show,1)}</b> <b>{$#collection_attributes[$adm.id].data_int}</b> <b>{$#collection_attributes[$adm.id]|attribute(show,1)}</b> <b>{$#collection_attributes|attribute(show,1)}</b> *}

{/let}
{/let}
{/let}

{/let}
{/foreach}

{/if}

{* if and( eq($server_validation, 1), eq( ezhttp('accept_cc'), '' ), eq( ezhttp('need_equip'), '' ), eq( ezhttp('monthly_charges'), '' ) )}
 {$http_post|attribute(show,1)}
{/if *}

{*

{if eq( $http_post_count, 0 )}
ERR0R::truth
{/if}

	 XERROR: {if and( eq( ezhttp('from_little_form'), false() ), eq( $option_question_answered, 'true' ) )}<h1>display:block|{$option_question_answered}</h1>{else}<strike>display:none|{$option_question_answered}</strike>{/if}
<hr />

		ERROR: {if eq( $http_post_count, 0 )}display:none1; 
			{elseif and( eq($server_validation, 0), eq( ezhttp('accept_cc'), '' ), eq( ezhttp('need_equip'), '' ), eq( ezhttp('monthly_charges'), '' ) )}display:none2;
			{elseif and( eq( ezhttp('from_little_form'), false() ), eq( $option_question_answered, 'false' ), eq($server_validation, 1), eq( ezhttp('accept_cc'), '' ), eq( ezhttp('need_equip'), '' ), eq( ezhttp('monthly_charges'), '' ) )}display:none3;
			{elseif and( eq( ezhttp('from_little_form'), true() ), eq( $option_question_answered, false() ), eq($server_validation, 1), eq( ezhttp('accept_cc'), '' ), eq( ezhttp('need_equip'), '' ), eq( ezhttp('monthly_charges'), '' ) )}display:none5;
			{elseif and( ezhttp('from_little_form'), eq( $option_question_answered, 'false' ) )}display:none4;{/if}
*}














    	<div class="Right FlashPromo"><img src={"/var/mw/storage/images/media/images/misc_site_images/account_animation/8498-1-eng-US/account_animation.gif"|ezdesign} alt="" width="108" height="111" border="0" /></div>      

{* 
  eq( $http_post_count, 0 ), 
	and( ezhttp('from_little_form'), eq( $option_question_answered, 'false' ) ),
	and( eq( ezhttp('from_little_form'), false() ), eq( $option_question_answered, 'false' ), eq($server_validation, 1), eq( ezhttp('accept_cc'), '' ), eq( ezhttp('need_equip'), '' ), eq( ezhttp('monthly_charges'), '' ) ),
  
*}

{if  or( ne( ezhttp('accept_cc'), '' ), 
			 ne( ezhttp('need_equip'), '' ), 
			      ne( ezhttp('monthly_charges'), '' )
)} 

	{* if ne( $http_post_count, 0 )}
	  {if eq( $partial_form, true ) *}
	     <p class="Intro">You're Almost Done!<br /><br />Thank you for starting our merchant request form. Your previous answers are already filled in.  Simply compete the remainder of the form and one of our merchant account executives will respond promptly.</p>
	  {* /if *}
        {else}
		{attribute_view_gui attribute=$node.object.data_map.description}
	{/if}

	<p>All required questions are marked below with a <span style="color:red; font-size:20px; font-weight:bolder;">*</span>.</p>

	<div class="field_error_message_container" id="topValidationMsg" style="{if or( 
	and( 
		eq( ezhttp('from_little_form'), true() ), 
		eq( $option_question_answered, false() ), 
		eq($server_validation, 1), 
		eq( ezhttp('accept_cc'), '' ), 
		eq( ezhttp('need_equip'), '' ), 
		eq( ezhttp('monthly_charges'), '' ) ), 

	and( 
		eq( ezhttp('from_little_form'), true() ), 
		eq( $option_question_answered, false() ), 
		eq($server_validation, 1) ), 

	eq($server_validation, 0) )
	)}display:none;{/if} margin-bottom: -5px; font-size: 14px;">
	  <p class="field_error_message">We were unable to submit the form. Please review the comments below.</p>
	</div>











		<div class="field_error_message_container" id="topValidationMsgAnswered" style="{if eq( $http_post_count, 0 )}display:none; {elseif and( eq($server_validation, 0), eq( ezhttp('accept_cc'), '' ), eq( ezhttp('need_equip'), '' ), eq( ezhttp('monthly_charges'), '' ) )}display:none;{elseif and( ezhttp('from_little_form'), eq( $option_question_answered, 'false' ) )}display:none;

{elseif and( eq( ezhttp('from_little_form'), false() ), eq( $option_question_answered, 'false' ), eq($server_validation, 1), eq( ezhttp('accept_cc'), '' ), eq( ezhttp('need_equip'), '' ), eq( ezhttp('monthly_charges'), '' ) )} display:none;
{elseif and( eq( ezhttp('from_little_form'), true() ), eq( $option_question_answered, false() ), eq($server_validation, 1), eq( ezhttp('accept_cc'), '' ), eq( ezhttp('need_equip'), '' ), eq( ezhttp('monthly_charges'), '' ) )} display:none;


{/if} margin-bottom: -5px; font-size: 14px;">

		  <p id="green_answers_text" style="margin-top: 5px;" >We have marked the answers you have already completed in <span class="greentextmsg" style="font-size:12px; font-weight:bold;">green</span> text.</p>
		</div>     		

        <form method="post" onsubmit="return validate_all(this);" action={"content/action"|ezurl}>
	<input type="hidden" name="dovalidate" value="1" />

	<table class="FormArea" cellspacing="10">
	<tr>
	<td class="Stroke" style="padding: 0px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; padding-top: 0px;">
	{foreach $attribs as $a}
          <div>
	    {def $a_name=$node.object.data_map.$a}
	    {attribute_view_gui attribute=$a_name supress_validation=$supress_validation checked_id=ezhttp( $a )}
	  </div>
        {/foreach}
	</td>

	{def $second_attribs=array( array( 'business_name', 'Business Name' ), array( 'type_of_products', 'Type of products sold or services provided' ), array( 'state', 'State (in which company is located)' ), array( 'zip_code', 'Zip Code' ), array( 'contact_name', 'Contact Name' ), array( 'contact_phone', 'Contact Phone' ), array( 'contact_email', 'Contact Email' ), array( 'comments', 'Additional questions or comments which may help us respond to your request' ))}

	<td style="padding: 0px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; padding-top: 5px;">
        {foreach $second_attribs as $s}
  	    {def $object_name=$s.0}
  	    {def $full_object_name=$node.object.data_map.$object_name}
            {attribute_view_gui attribute=$full_object_name supress_validation=$supress_validation checked_id=ezhttp( $s.0 )}
        {/foreach}
  	    <div align="right" style="margin-top: 15px; margin-right: 20px;"><input type="image" name="ActionCollectInformation" src={"images/btn-submit_request.gif"|ezdesign} /></div>
  	  </td>
	</tr>	
	</table>

	<table id="FormFooter" cellspacing="5" border="0">
		<tr>
			<td valign="middle" class="formcol1"><div>All merchants must submit a formal application in order to obtain a merchant account.</div></td>
			<td width="123" align="right" valign="middle"><img src={"images/btn-secure.gif"|ezdesign} alt="" width="23" height="23" border="0" align="middle" /></td>
			<td width="100" align="right" valign="middle"><nobr><div>Secure & Private Transactions</div></nobr></td>

		</tr>
                        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
                        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
                        <input type="hidden" name="ViewMode" value="full" /></form>	
	</table>
