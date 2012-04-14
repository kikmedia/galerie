<div class="<?php echo $this->class; ?> block"<?php echo $this->cssID; ?><?php if ($this->style): ?> style="<?php echo $this->style; ?>"<?php endif; ?>>
    <?php if ($this->headline): ?>
        <<?php echo $this->hl; ?>><?php echo $this->headline; ?></<?php echo $this->hl; ?>>
    <?php endif; ?>
    
<?php if (($this->noImages == FALSE) && ($this->flickr == FALSE) && ($this->picasa == FALSE)): ?>
    
        <?php if (($this->flickr == FALSE) && ($this->picasa == FALSE)): ?>
        
            <div id="<?php echo $this->alias.'-'.$this->moduleID; ?>">

                <?php foreach ($this->pictures as $pictures):
		
		    if (($pictures['video'] != NULL) && ($pictures['iframe'] == NULL)):
			if ($pictures['videoThumb']):
			    echo '<a href="' . $pictures['video'] . '"><span class="video"></span></a>';
			else:
			    echo '<a href="' . $pictures['video'] . '"><img src="'.$pictures['thumbnailSRC'].'" ' . '/></a>';
			endif;
		    elseif (($pictures['iframe'] != NULL) && ($pictures['video'] == NULL)):
			if ($pictures['iframeThumb']):
			    echo '<a href="' . $pictures['iframe'] . '"><span class="iframe"></span></a>';
			else:
			    echo '<a href="' . $pictures['iframe'] . '"><img class="iframe" src="'.$pictures['thumbnailSRC'].'" ' . '/></a>';
			endif;
		    else:
			echo '<a' . ($pictures['imageFullscreenSRC'] ? ' rel="'.$pictures['imageFullscreenSRC'].'" ' : ' ') . 'href="'.$pictures['imageSRC'].'"><img alt="'.$pictures['alt'].'" title="'.$pictures['title'].'" src="'.$pictures['thumbnailSRC'].'" ' . ($pictures['imageUrl'] ? 'longdesc="'.$pictures['imageUrl'].'" ' : '') . '/></a>';
		    endif;
		
                endforeach; ?>

            </div>

        <?php else: echo '<div id='.$this->alias.'-'.$this->moduleID.'></div>'; ?>
        
        <?php endif; ?>
        
    <?php else: echo '<p>'.$this->noImages.'</p>'; endif; ?>
</div>

<?php if ($this->noImages == FALSE) : ?>
    <script type="text/javascript">
	<!--//--><![CDATA[//><!--
	// Load JS file theme
	Galleria.loadTheme('<?php echo $this->pathJS; ?>');
	
	// Initialize Galleria
    
	    Galleria.run('#<?php echo $this->alias.'-'.$this->moduleID; ?>')
	    Galleria.configure(<?php if($this->options) echo '{'; ?>
    
	    <?php
		for ($i = 0; $i < count($this->options); $i++) {
		    echo($this->options[$i]);
		}
	    ?>
		  
	    <?php if ($this->flickr == TRUE): echo ',' ?>
		
		<?php echo $this->flickrFunction; ?>
    
	    <?php endif; ?>
    
	    <?php if ($this->picasa == TRUE): echo ',' ?>
		
		<?php echo $this->picasaFunction; ?>
    
	    <?php endif; ?>
    
	    <?php if($this->options) echo '}'; ?>);
    
	//--><!]]>
    </script>
<?php endif; ?>