<?php if (!empty($error['warning'])) { ?>
<div class="warning alert alert-error alert-danger"><?php echo $error['warning']; ?></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success alert alert-success"><?php echo $success; ?></div>
<?php } ?>

<ul class="nav nav-tabs nav-justified nav-profile">
	<?php
		foreach ($tabs as $tab) {
			if($tab['active'] ){
				$classname = 'active';
			}elseif(!$tab['active'] && $attribute_id){
				$classname = 'inactive';
				$tab['href'] = '';
			}else{
				$classname = '';
			}
	?>		<li class="<?php echo $classname; ?>"><a <?php echo ($tab['href'] ? 'href="' . $tab['href'] . '" ' : ''); ?>><strong><?php echo $tab['text']; ?></strong></a></li>
	<?php } ?>

	<?php echo $this->getHookVar('extension_tabs'); ?>
</ul>
<div class="tab-content">

	<div class="panel-heading">

			<div class="pull-right">
			    <div class="btn-group mr10 toolbar">
                    <a class="btn btn-white tooltips" href="<?php echo $clone_url; ?>" data-toggle="tooltip" title="<?php echo $text_clone; ?>" data-original-title="<?php echo $text_clone; ?>">
                    <i class="fa fa-tags"></i>
                    </a>
                    <?php if (!empty ($help_url)): ?>
                    <a class="btn btn-white tooltips" href="<?php echo $help_url; ?>" target="new" data-toggle="tooltip" title="" data-original-title="Help">
                    <i class="fa fa-question-circle"></i>
                    </a>
                    <?php endif; ?>
			    </div>

                <?php echo $form_language_switch; ?>
			</div>

	</div>

	<?php echo $form['form_open']; ?>
	<div class="panel-body panel-body-nopadding">
			<?php
				foreach ($form['fields'] as $name => $field) {

				//Logic to cululate fileds width
				$widthcasses = "col-sm-7";
				if ( is_int(stripos($field->style, 'large-field')) ) {
					$widthcasses = "col-sm-7";
				} else if ( is_int(stripos($field->style, 'medium-field')) || is_int(stripos($field->style, 'date')) ) {
					$widthcasses = "col-sm-5";
				} else if ( is_int(stripos($field->style, 'small-field')) || is_int(stripos($field->style, 'btn_switch')) ) {
					$widthcasses = "col-sm-3";
				} else if ( is_int(stripos($field->style, 'tiny-field')) ) {
					$widthcasses = "col-sm-2";
				}
				$widthcasses .= " col-xs-12";
			?>
		<div class="form-group <? if (!empty($error[$name])) { echo "has-error"; } ?>">
			<label class="control-label col-sm-3 col-xs-12" for="<?php echo $field->element_id; ?>"><?php echo ${'entry_' . $name}; ?></label>
			<div class="input-group afield <?php echo $widthcasses; ?> <?php echo ($name == 'description' ? 'ml_ckeditor' : '')?>">
				<?php echo $field; ?>
			</div>
		    <?php if (!empty($error[$name])) { ?>
		    <span class="help-block field_err"><?php echo $error[$name]; ?></span>
		    <?php } ?>
		</div>

			<?php }  ?><!-- <div class="fieldset"> -->

		<?php
		// extension related piece of form
		echo $subform; ?>

	</div>

	<div class="panel-footer">
		<div class="row">
		   <div class="col-sm-6 col-sm-offset-3">
		     <button class="btn btn-primary">
		     <i class="fa fa-save"></i> <?php echo $form['submit']->text; ?>
		     </button>&nbsp;
		     <a class="btn btn-default" href="<?php echo $cancel; ?>">
		     <i class="fa fa-refresh"></i> <?php echo $form['cancel']->text; ?>
		     </a>
		   </div>
		</div>
	</div>
	</form>

</div><!-- <div class="tab-content"> -->