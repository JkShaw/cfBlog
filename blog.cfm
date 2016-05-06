

<cfquery name="myBlog" datasource="Learncfinaweek">
	SELECT	bp.title,
			bp.summary,
			bp.datePosted,
			bp.blogpostid,
			bcc.name,
			bpc.blogCategoryid,
			COUNT(bc.blogCommentid) AS noOfComments
	FROM	blogpost bp
			INNER JOIN	blogpostcategory bpc
				ON	bp.blogpostid = bpc.blogpostid
			LEFT JOIN	blogcomment bc
				ON	bp.blogpostid = bc.blogpostid
			INNER JOIN	blogcategory bcc
				ON	bcc.blogcategoryid = bpc.blogcategoryid
	GROUP BY	bp.title,
				bp.summary,
				bp.datePosted,
				bp.blogpostid,
				bpc.blogCategoryid,
				bc.blogCommentid
	ORDER BY	datePosted
</cfquery>

<cfset section = "blog" />
<cfinclude template="includes/header.cfm" />
		
		<!-- Content Start -->
    
		<!--Card  -->
		<div id="content">
			<div class="card-pattern">
				<!-- blog -->
				<div id="blog">
					<div class="clr">
						<div class="top-bg1">
							<div class="top-left">
								<div><h1>Blog</h1></div>
							</div> 
						</div>
						<div class="clr">
							<div class="pat-bottomleft">&nbsp;</div>
							<div class="pat-bottomright">&nbsp;</div>
						</div>
					</div>
					<div class="blog-top">	
						<div class="clr">
							<div class="left">
								<!-- Blog Posts -->
								<!-- Start Blog Post -->
								<cfoutput query="myBlog" group="datePosted">
									
								
								<h5>
									<span>#myBlog.datePosted# </span>
								</h5>
								<cfoutput>
									
								<h2>
									<a href="blogpost.cfm?id=#myBlog.blogPostid#">#myBlog.title#</a>
								</h2>
								<p>#myBlog.summary#</p>
								<p class="summary">
									<strong>Categories:</strong> #myBlog.name# <strong>Comments:</strong> #myBlog.noOfComments#
								</p>
								</cfoutput>
								</cfoutput>
								<!-- End Blog Post -->
								
							<div class="right" >
								<h2>Categories</h2>
								<!-- Blog Categories -->
								<div id="categories" align="center">
									<ul>
										<li><a href="#">ColdFusion</a></li>
										<li><a href="#">Development</a></li>
										<li><a href="#">HTML5</a></li>
										<li><a href="#">Javascript</a></li>
										<li><a href="#">jQuery</a></li>
										<li><a href="#">Misc</a></li>
										<li><a href="#">Video Games</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="clr"></div>
				</div> <!--blog end -->

				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>
		</div>		  <!--content end -->	
<cfinclude template="includes/footer.cfm" />