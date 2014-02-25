{{extends file="web/layout.html.tpl"}}
{{block name="title" prepend}}home {{/block}}

{{block name="content"}}
	<div id="main">
		<!-- Home
		=========================================== -->
		<section class="home parallax full" id="home">
			<div class="truecontent">
				<div class="home_content fade-that" id="intro">
					<!-- Logo -->

					<div class="logo">
						<img src="/resource/web/images/logo_white.png" alt="logo" />
					</div>
					<!-- Caption -->
					<h2>
						{   CodeIgniter 驱动 快速web开发框架   }


					</h2>			

					<!-- Button -->

					<a href="#portfolio" class="button scrollink">Our Projects</a>
				</div>
				<!-- Scroll Down -->

				<a href="#about" class="scrolldown scrollink"><i class="icon-angle-down"></i></a>
			</div>	
		</section>
		<!-- Home / END
		=========================================== -->

		<!-- ABOUT
		=========================================== -->
		<section class="about" id="about">
			<div class="container">	
				<!-- Title -->
				<div class="title">
					<h2>Let us introduce ourselves.</h2>

					<p>Creative Agency coming from London. The most important thing defines us is that we are doing what we love to do and we will do that how long we can. That’s what we call passion.</p>
				</div>	

				<!-- Team -->

				<div id="team" class="team offset-by-two">
					<!-- First Dude -->

					<figure class="team_member four columns"> 

						<img src="/resource/web/images/team1.jpg" alt="" />

						<figcaption>

							<!-- Short Info -->

							<div class="more_about">

								<h5>Jane</h5>

								<p>Jane came from New Zeland,

								she is the best in our mood improving.</p>

								<ul class="socials">

									<li><a href="#"><i class="icon-linkedin"></i></a></li>

									<li><a href="#"><i class="icon-facebook"></i></a></li>

								</ul>

							</div>

							

							<!-- Name / Title -->

							Jane <span>/ Founder</span>

							

						</figcaption>
					</figure>
					

					<!-- Second Dude -->

					<figure class="team_member four columns"> 

						<img src="/resource/web/images/team2.jpg" alt="" />

						<figcaption>

							<!-- Short Info -->

							<div class="more_about">

								<h5>Rachel</h5>

								<p>Rachel like flowers and cats, 

								she is very talented designer from Poland.</p>

								<ul class="socials">

									<li><a href="#"><i class="icon-dribbble"></i></a></li>

									<li><a href="#"><i class="icon-twitter"></i></a></li>

								</ul>
							</div>		

							<!-- Name / Title -->

							Rachel <span>/ Designer</span>

						</figcaption>

					</figure>

					<!-- Third Dude -->

					<figure class="team_member four columns"> 

						<img src="/resource/web/images/team3.jpg" alt="" />

						<figcaption>

							<!-- Short Info -->

							<div class="more_about">

								<h5>Jeffrey</h5>

								<p>This guy make the best coffee, 

								u can ever imagine. Rachel's husband.</p>

								<ul class="socials">

									<li><a href="#"><i class="icon-twitter"></i></a></li>

									<li><a href="#"><i class="icon-github-alt"></i></a></li>

								</ul>

							</div>
							<!-- Name / Title -->

							Jeffrey <span>/ Developer</span>
				

						</figcaption>
					</figure>
					<!-- Put some more Dude's -->
				</div>			

				<!-- Scroll Down -->
				<a href="#services" class="scrolldown scrollink"><i class="icon-angle-down"></i></a>
			</div><!-- Container -->
		</section>

		<!-- ABOUT / END
		=========================================== -->
		<!-- SERVICES

		=========================================== -->

		<section class="services parallax clearfix" id="services">
			<div class="container">	
				<div class="sixteen columns">	
					<!-- Title -->
					<div class="title-color">
						<h2>Our Experience</h2>
						<p>Hide when guests come over climb leg sweet beast lick butt intently stare at the same spot for attack feet. Hopped up on goofballs. Hide when guests come over make muffins burrow under covers. </p>

					</div>

					<!-- List of services -->

					<div class="services_list">

						<ul class="clearfix">
							<li>
								<img src="/resource/web/images/icons/illustration.png" alt="Illustration"/>

								<h3>Illustration</h3>

							</li>

							<li>
								<img src="/resource/web/images/icons/camera.png" alt="Photography"/>

								<h3>Photography</h3>

							</li>

							<li>
								<img src="/resource/web/images/icons/video.png" alt="Video Production"/>

								<h3>Video</h3>

							</li>

							<li>
								<img src="/resource/web/images/icons/web.png" alt="Web Design"/>

								<h3>Web Design</h3>

							</li>

							<li>

								<img src="/resource/web/images/icons/app.png" alt="Mobile Aplications"/>

								<h3>Apps</h3>

							</li>

							<li>

								<img src="/resource/web/images/icons/commerce.png" alt="e-commerce"/>

								<h3>E-Commerce</h3>

							</li>

						</ul>

					</div>
				</div><!-- XVI columns -->
			</div><!-- Container -->

			<!-- Scroll Down -->

			<a href="#portfolio" class="scrolldown scrollink"><i class="icon-angle-down"></i></a>
		</section>

		<!-- SERVICES / END

		=========================================== -->

		<!-- PORTFOLIO/GALLERY (CALL IT YOURSELF)
		=========================================== -->

		<section class="portfolio" id="portfolio">
			<!-- 960 Container -->
			<div class="container">
				<!-- Title -->
				<div class="title">
					<h2>Portfolio</h2>
					<p>We create original designs for both large organizations and small businesses. We were not disappointed yet any customer, which is confirmed by our achievements.</p>

				</div>

				

			</div>

			<!-- 960 Container / End -->

				

			<!-- 960 Container -->

			<div class="container">

			

				<!-- Isotope Filter -->

				<div class="sixteen columns">

					<ul id="filters" class="option-set">

						<li class="selected"><a href="#filter" data-filter="*">show all</a></li>

						<li><a href="#filter" data-filter=".identity">identity</a></li>

						<li><a href="#filter" data-filter=".photography">photography</a></li>

						<li><a href="#filter" data-filter=".identity, .illustration">illustration</a></li>

					</ul>

				</div>

				<!-- Isotope Filter / End -->

				

			</div>

			<!-- 960 Container / End -->



			<!-- 960 Container -->

			<div class="container">

			

				<!-- Isotope Portfolio -->

				<div id="portfolio-container">



			

					<!-- 1st Item -->

					<div class="item identity small">

						<!-- Thumb -->

						<a href="portfolio/bubble.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/1.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Talia</h5>

									<span>Identity</span>

								</figcaption>

							</figure>

						</a>

					</div>

					



					<!-- 2nd Item -->

					<div class="item identity small">

						<a href="portfolio/outrage.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/3.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Q</h5>

									<span>Identity</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 3rd Item -->

					<div class="item photography long">

						<a href="portfolio/callendar.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/2.jpg" alt="" />

								<figcaption class="item-description">

									<h5>2013 Calendar</h5>

									<span>Photography</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 4th Item -->

					<div class="item photography tall">

						<a href="portfolio/outrage.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/4.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Outrage</h5>

									<span>Photography</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 5th Item -->

					<div class="item illustration small">

						<a href="portfolio/callendar.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/5.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Bro team</h5>

									<span>Illustration</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 6th Item -->

					<div class="item photography big">

						<a href="portfolio/bubble.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/6.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Bubble Shooter</h5>

									<span>Photography</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 7th Item -->

					<div class="item illustration small">

						<a href="portfolio/bubble.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/7.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Raccoon</h5>

									<span>Illustration</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 8th Item -->

					<div class="item illustration small">

						<a href="portfolio/callendar.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/8.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Owlskull</h5>

									<span>Illustration</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 9th Item -->

					<div class="item illustration small">

						<a href="portfolio/callendar.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/9.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Crystals</h5>

									<span>Illustration</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 10th Item -->

					<div class="item photography big">

						<a href="portfolio/outrage.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/10.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Outrage</h5>

									<span>Photography</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 11th Item -->

					<div class="item illustration small">

						<a href="portfolio/bubble.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/11.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Owl</h5>

									<span>Illustration</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 12th Item -->

					<div class="item identity small">

						<a href="portfolio/outrage.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/12.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Ink</h5>

									<span>Identity</span>

								</figcaption>

							</figure>

						</a>

					</div>

					

					<!-- 13th Item -->

					<div class="item identity small">

						<a href="portfolio/callendar.html" class="page">

							<figure class="portfolio-item">	

								<img src="/resource/web/images/thumb/13.jpg" alt="" />

								<figcaption class="item-description">

									<h5>Éric Le Tutour</h5>

									<span>Identity</span>

								</figcaption>

							</figure>

						</a>

					</div>

						

				</div>

				<!-- Isotope Portfolio / End -->

				

				<!-- Scroll Down -->

				<a href="#buynow" class="scrolldown scrollink"><i class="icon-angle-down"></i></a>

		

			</div>

			<!-- 960 Container / End -->

		</section>

		<!-- PORTFOLIO / END

		=========================================== -->



		<!-- I HAVE NO IDEA WHAT IS THIS BUT PUT SOME NICE STUFF HERE!

		=============================================================== -->

		<section class="buynow parallax" id="buynow">
			<div class="container">	
				<!-- Title -->
				<div class="title-color">
					<h2>Do you like this template?</h2>

					<p>Electric ray bluefish, bluefish mola; cavefish Rasbora. Turbot sailfish mudskipper, gurnard tiger barb yellowtail barracuda whiff collared carpetshark salamanderfish lungfish.</p>
				</div>	
				<!-- Button -->
				<a href="http://themeforest.net/item/talia-responsive-one-page-template/5972802?ref=Nevide" class="button">Buy Now!</a>
			</div><!-- Container -->	

			<!-- Scroll Down -->

			<a href="#contact" class="scrolldown scrollink"><i class="icon-angle-down"></i></a>
		</section>

		<!-- I HAVE NO IDEA WHAT IS THIS BUT PUT SOME NICE STUFF HERE! / END

		=============================================================== -->
		<!-- CONTACT
		=========================================== -->
		<section class="contact" id="contact">	
			<!-- 960 Container -->
			<div class="container">	
				<!-- Title -->

				<div class="title">
					<h2>Get in touch</h2>
					<p>Climb leg rub face on everything give attitude nap all day for under the bed. Chase mice attack feet but rub face on everything hopped.</p>
				</div>
				

				<!-- Contact Form -->
				<div class="contact-form">
					<!-- Succes Message -->
					<div class="sixteen columns">
						<div class="success-message">
							<p>Your message has been sent!</p>
						</div>
					</div>			

					<!-- Form -->

					<form class="clearfix" method="post" action="contact.php">
						<div class="eight columns">
							<!-- Name -->
							<div class="field user">
								<input type="text" name="name" class="text" value="Name" onblur="if (this.value == '') {this.value = 'Name';}" onfocus="if (this.value == 'Name') {this.value = '';}"/>

							</div>
							<!-- Email -->
							<div class="field envelope">
								<input type="email" name="email" class="text" value="Email" onblur="if (this.value == '') {this.value = 'Email';}" onfocus="if (this.value == 'Email') {this.value = '';}"/>

							</div>

							

							<!-- Select List -->
							<div class="field">
								<div class="select money">
									<select name="budget" class="budget">

										<option value="">Select Your Budget...</option>

										<option value="$100-$250">100-250$</option>

										<option value="$250-$500">250-500$</option>

										<option value="$500-$1000">500-1000$</option>

										<option value="$1000 or more">1000$ or more</option>

									</select>

								</div>

							</div>	

							<!-- Subject -->
							<div class="field bulb">
								<input type="text" name="asubject" class="text" value="Subject" onblur="if (this.value == '') {this.value = 'Subject';}" onfocus="if (this.value == 'Subject') {this.value = '';}"/>
							</div>
						</div><!-- 8 columns -->
						

						<div class="eight columns">
							<!-- Message -->
							<div class="field pen">
								<textarea name="message" class="text textarea" onblur="if (this.value == 'Message') {this.value = '';}" onfocus="if (this.value == 'Message') {this.value = '';}">Message</textarea>

							</div>

							<!-- Send Button -->
							<div class="field">
								<button id="send" class="send"><span aria-hidden="true" class="li_paperplane"></span>Submit</button>

								<div class="loading"></div>
							</div>
						</div><!-- 8 columns -->
					</form>

				</div>

				<!-- Contact Form / End -->
				<!-- Scroll Down -->
				<a href="#footer_waypoint" class="scrolldown scrollink"><i class="icon-angle-down"></i></a>	
			</div>	
		</section>
		<!-- CONTACT / END
		=========================================== -->
	</div><!-- Main -->

	<!-- FOOTER
	=========================================== -->

	<footer class="full">
		<div class="truecontent container">
			<div class="footer_content sixteen columns" id="footer">
				<!-- Logo -->
				<div class="logo">
					<img src="/resource/web/images/logo_white.png" alt="logo" />
				</div>			

				<div class="contact_details">
					<p><i class="icon-map-marker"></i> The Talia Company, 22 Street, City<br/>

					<i class="icon-envelope"></i> <a href="mailto:contact@talia.com">contact@talia.com</a>, 

					 <i class="icon-phone"></i>  Tel: (48) 535 123 456

					</p>

				</div>			

				<ul class="social_icons">

					<li><a href="#" class="social facebook"><i class="icon-facebook"></i></a></li>

					<li><a href="#" class="social dribbble"><i class="icon-dribbble"></i></a></li>

					<li><a href="#" class="social twitter"><i class="icon-twitter"></i></a></li>

					<li><a href="#" class="social google_plus"><i class="icon-google-plus"></i></a></li>
				</ul>

				<!-- Scroll Top -->

				<a href="#home" class="scrollink scroll-top">
					<i class="icon-angle-up"></i>
				</a>
			</div>	
		</div>
		<div id="footer_waypoint"></div>
	</footer>

<!-- FOOTER / END

=========================================== -->
{{/block}}
<!-- End Document

================================================== -->

	<!-- <script src="./js/jquery-1.9.1.min.js" type="text/javascript"></script>

	<script src="./js/retina.min.js" type="text/javascript"></script>=

	<script src="./js/detect.js" type="text/javascript"></script> =

	<script src="./js/jquery.appear.js" type="text/javascript"></script>=

	<script src="./js/jquery.sidr.min.js" type="text/javascript"></script>

	<script src="./js/pageslide.js" type="text/javascript"></script>=

	<script src="./js/isotope.min.js" type="text/javascript"></script>=

	<script src="./js/parallax.js" type="text/javascript"></script>=

	<script src="./js/scrollTo.js" type="text/javascript"></script>=

	<script src="./js/header.js" type="text/javascript"></script>=

	<script src="./js/photoset-grid.js" type="text/javascript"></script>=

	<script src="./js/fancySelect.js" type="text/javascript"></script>=

	<script src="./js/contact.js" type="text/javascript"></script>=

	<script src="./js/smoothscroll.js" type="text/javascript"></script> 

	<script src="./js/custom.js" type="text/javascript"></script> =-->
	<!-- // <script src="./js/switcher.js" type="text/javascript"></script> -->
{{block page_script}} load('page/index') {{/block}}