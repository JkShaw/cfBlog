
<cfquery name="myPortfolio" datasource="Learncfinaweek">
	SELECT	title,
			website,
			image,
			summary
	FROM	portfolio
	ORDER BY 	title
</cfquery>

<cfset section = "portfolio" />
<cfinclude template="includes/header.cfm" />

		
		<!-- Content Start -->
    
		<!--Card  -->
		<div id="content">
			<div class="card-pattern">
			<!-- portfolio -->
				<div id="portfolio">
					<div class="clr">
						<div class="top-bg1">
							<div class="top-left">
								<div>
									<h1>Portfolio</h1>
								</div>
							</div> 
						</div>
						<div class="clr">
							<div class="pat-bottomleft">&nbsp;</div>
							<div class="pat-bottomright">&nbsp;</div>
						</div>
					</div>
					<div class="clr">
						<h6>
							<span> I build great sites <br /></span>Hello, thanks for visiting this section. Here’s a collection of some of my work.
						</h6>
					</div>
					<div class="clr hline">&nbsp;</div>
					<div class="clr">
						<div>
							<ul id="portfolio-list">
								<!-- Start Portfolio -->
								<cfoutput query="myPortfolio" group="summary">
								<cfoutput>
                                		<li>
											<div class="left">
												<a href="#myPortfolio.website#" title="#myPortfolio.title#" class="viewDetail ">
													<img src="assets/images/portfolio/#myPortfolio.image#"   alt=" " border="0" />
													<h5>#myPortfolio.title#</h5>
												</a>
											</div>
											<div class="right">
												<p>
													#myPortfolio.summary#
												</p>
											</div>
										</li>
								</cfoutput>
							</cfoutput>
								<!-- End Portfolio -->
							</ul>
						</div>
						<!-- demowrap end-->       
					</div>
					<!-- clr end -->
					<div class="clr"></div>
				</div>
				<!-- portfolio end -->
		
				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>
		</div>		  <!--content end -->	
<cfinclude template="includes/footer.cfm" />