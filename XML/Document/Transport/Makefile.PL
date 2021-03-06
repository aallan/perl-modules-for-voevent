use ExtUtils::MakeMaker;

WriteMakefile( 
               'NAME'          => 'XML::Document::Transport',
	       'VERSION'       => '0.1',
               'PREREQ_PM'     => {  },
	       'dist'          => { COMPRESS => "gzip -9f"},
	       ($] >= 5.005 ?   ## 
	       ( ABSTRACT      => 'Module designed to parse Transport messages',
		 AUTHOR        => 'Alasdair Allan <aa@astro.ex.ac.uk>') : ()),
             );

