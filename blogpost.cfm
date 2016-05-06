<cfparam name="URL.id" default="0">
<cfparam name="section" default="home" />
<cfquery name="myBlog" datasource="Learncfinaweek">
	SELECT	bp.title,
			bp.summary,
			bp.datePosted,
			bp.body,
			bp.blogpostid,
			bcc.name,
			bpc.blogCategoryid,
			--bc.author,
			--bc.createdDateTime,
			--bc.comment,
			COUNT(bc.blogCommentid) AS noOfComments
	FROM	blogpost bp
			INNER JOIN	blogpostcategory bpc
				ON	bp.blogpostid = bpc.blogpostid
			LEFT JOIN	blogcomment bc
				ON	bp.blogpostid = bc.blogpostid
			INNER JOIN	blogcategory bcc
				ON	bcc.blogcategoryid = bpc.blogcategoryid
	WHERE	bp.blogpostid = #URL.id#
	GROUP BY	bp.title,
				bp.summary,
				bp.datePosted,
				bp.blogpostid,
				bpc.blogCategoryid,
				--bc.blogCommentid,
				--bc.author,
				--bc.createdDateTime,
				--bc.comment
	ORDER BY	blogpostid
</cfquery>

<cfquery name="comments" datasource="Learncfinaweek">
	SELECT	author,
			comment,
			createdDatetime
	FROM	blogComment
	WHERE	blogpostid = #URL.id#
	ORDER BY	createdDatetime
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
								<cfoutput query="myBlog">
									<!-- Blog Title -->
									<h2 class="big">
										#myBlog.title#
									</h2>
									<!-- Date Published -->
									<h5>
										<strong>Date Posted</strong>: #myBlog.datePosted#
									</h5>
									<!-- Blog Body -->
									<p>
										#myBlog.body#
									</p>
									<!-- Blog Export -->
									<p>
										<a href="exportToPDF.cfm?id=#myBlog.blogpostid#" target="_new"><img src="assets/images/export_pdf.png" border="0"/></a>
									</p>
									<!-- Blog Comments Section -->

									<h3>
										Comments (#myBlog.noOfComments#)
									</h3>
									<div class="clr hline">&nbsp;</div>
								</cfoutput>
								<div class="clr comments">
									<ul>
										<!-- Start Comment -->
										<cfoutput query="comments">
											
										
										<li>
											<p>
												<strong>Posted On:</strong> #dateFormat(comments.createdDateTime,'mm/dd/yyyy')# at #timeFormat(comments.createdDateTime,'short')# By #comments.author#
											</p>
											<p>
												#comments.comment#
											</p>
											<div class="clr hline">&nbsp;</div>
										</li>
										</cfoutput>
										<!-- End Comment -->
										
									</ul>
								</div>
								
								<h3>
									Post Comment
								</h3>
								<div class="clr hline">&nbsp;</div>
		
								<div class="clr postComment">
									<form action="blogpost.cfm" method="post" id="form">
										<div>
											<label>Name <span class="font-11">(required)</span></label>
											<input name="contactname" type="text" class="required" />
										</div>
										<div class="textarea">
											<label>Comment <span class="font-11">(required)</span></label>				
											<textarea name="comment" rows="6" cols="60" class="required"></textarea>		
										</div>
										<div>
											<input id="submitBtn" value="Submit"  name="submit" type="submit" class="submitBtn" />
										</div>
										<input type="hidden" name="submitted" value="1" />
									</form>
								</div>
									
							</div>
							<div class="right" >
								<h2>Categories</h2>
								<!-- Blog Specific Categories -->
								<div id="categories" align="center">
									<ul>
										<li><a href="#">ColdFusion</a></li>
										<li><a href="#">Development</a></li>
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