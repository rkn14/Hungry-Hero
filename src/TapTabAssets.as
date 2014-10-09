package
{
	public class TapTabAssets
	{
		// BG IMAGE
		[Embed(source="../remoteassets/bgImage.jpg", mimeType="application/octet-stream")]
		public static var BMP_BGIMAGE : Class;
		
		 
		// SOUNDS
		
		// eat		
		[Embed(source="../media/sounds/eat.mp3", mimeType="application/octet-stream")]
		public static var SND_EAT:Class;
		
		// lose		
		[Embed(source="../media/sounds/lose.mp3", mimeType="application/octet-stream")]
		public static var SND_LOSE:Class;
		

		
		// APP ICON
		[Embed(source="../src/icons/icon_128.png", mimeType="application/octet-stream")]
		public static const BMP_APP_ICON : Class;
		
		
		
		// LAYOUTS ----------------
		
		// welcome
		public static const LAYOUT_WELCOME_XML : XML = 
			<layout name="Layout_welcome" id="Welcome" version="1.0" author="Grégory Lardon" dpi="220">
				<portrait>				
					<bgColor>#000000</bgColor>	
					<bgAlpha>0.7</bgAlpha>		
					<bgImage>bgImage</bgImage>
					<controls>
						<squareButton id="bt_PLAY">
							<bgWidth>400</bgWidth>
							<bgHeight>150</bgHeight>
							<bgColor>0XFF0000</bgColor>
							<bgAlpha>.6</bgAlpha>
							<buttonWidth>400</buttonWidth>
							<buttonHeight>150</buttonHeight>
							<buttonColor>0XFF0000</buttonColor>							
							<buttonAlpha>1</buttonAlpha>
							<align vcenter="0" hcenter="0" />
							<label>
								<text>PLAY</text>
								<style size="35" color="#FFFFFF" align="center" font="Arial" bold="true" />
								<align hcenter="0" vcenter="0" />
							</label> 							
							<action type="playSound" trigger="touchDown">sndButton</action>
						</squareButton>
						<squareButton id="bt_ABOUT">
							<bgWidth>300</bgWidth>
							<bgHeight>150</bgHeight>
							<bgColor>0XFF0000</bgColor>
							<bgAlpha>.6</bgAlpha>
							<buttonWidth>300</buttonWidth>
							<buttonHeight>150</buttonHeight>
							<buttonColor>0XFF0000</buttonColor>							
							<buttonAlpha>1</buttonAlpha>
							<align hcenter="0" bottom="40" />
							<label>
								<text>ABOUT</text>
								<style size="35" color="#FFFFFF" align="center" font="Arial" bold="true" />
								<align hcenter="0" vcenter="0" />
							</label> 
							<action type="playSound" trigger="touchDown">sndButton</action>				
						</squareButton>
					</controls>
				</portrait>				
			</layout>;
		
		
		
		// in game intro
		public static const LAYOUT_INGAME_INTRO_XML : XML = 
			<layout name="Layout_inGameIntro" id="InGameIntro" version="1.0" author="Grégory Lardon" dpi="220">
				<portrait>				
					<bgColor>#000000</bgColor>	
					<bgAlpha>0.7</bgAlpha>		
					<bgImage>bgImage</bgImage> 
					<controls>
						<squareButton id="bt_START">
							<bgWidth>400</bgWidth>
							<bgHeight>150</bgHeight>
							<bgColor>0XFF0000</bgColor>
							<bgAlpha>.6</bgAlpha>
							<buttonWidth>400</buttonWidth>
							<buttonHeight>150</buttonHeight>
							<buttonColor>0XFF0000</buttonColor>							
							<buttonAlpha>1</buttonAlpha>
							<align vcenter="0" hcenter="0" />
							<label>
								<text>START</text>
								<style size="35" color="#FFFFFF" align="center" font="Arial" bold="true" />
								<align hcenter="0" vcenter="0" />
							</label> 
							<action type="playSound" trigger="touchDown">sndButton</action>										
						</squareButton>
					</controls>
				</portrait>				
			</layout>;
		
		// in game
		public static const LAYOUT_INGAME_XML : XML = 
			<layout name="Layout_inGame" id="InGame" version="1.0" author="Grégory Lardon" dpi="220">
				<variables>
					<variable id="score" value="0"/>
				</variables>
				<portrait>				
					<bgColor>#000000</bgColor>	
					<bgAlpha>0.7</bgAlpha>		
					<bgImage>bgImage</bgImage>
					<controls>
						<label id="gestureLabel">
							<text><![CDATA[{{{score}}}]]></text>
							<style size="40" color="#FFFFFF" align="center" font="Arial" bold="true" />
							<align top="10" right="10" />
						</label> 
						<gesturePad id="gesturePad" >
							<width>80%</width>
							<height>60%</height>
							<bgColor>0XFF0000</bgColor>
							<bgAlpha>.6</bgAlpha>
							<align vcenter="0" hcenter="0" />
							<label id="gestureLabel">
								<text>Touch here!</text>
								<style size="35" color="#FFFFFF" align="center" font="Arial" bold="true" />
								<align hcenter="0" vcenter="0" />
							</label> 							
						</gesturePad>
					</controls>
				</portrait>				
			</layout>;
		
		// lose
		public static const LAYOUT_LOSE_XML : XML = 
			<layout name="Layout_lose" id="Lose" version="1.0" author="Grégory Lardon" dpi="220">
				<portrait>				
					<bgColor>#000000</bgColor>	
					<bgAlpha>0.7</bgAlpha>		
					<bgImage>bgImage</bgImage> 
					<controls>
						<squareButton id="bt_MAIN">
							<bgWidth>400</bgWidth>
							<bgHeight>150</bgHeight>
							<bgColor>0XFF0000</bgColor>
							<bgAlpha>.6</bgAlpha>
							<buttonWidth>400</buttonWidth>
							<buttonHeight>150</buttonHeight>
							<buttonColor>0XFF0000</buttonColor>							
							<buttonAlpha>1</buttonAlpha>
							<align vcenter="-200" hcenter="0" />
							<label>
								<text>MAIN</text>
								<style size="35" color="#FFFFFF" align="center" font="Arial" bold="true" />
								<align hcenter="0" vcenter="0" />
							</label>
							<action type="playSound" trigger="touchDown">sndButton</action>												
						</squareButton>
						<squareButton id="bt_PLAYAGAIN">
							<bgWidth>400</bgWidth>
							<bgHeight>150</bgHeight>
							<bgColor>0XFF0000</bgColor>
							<bgAlpha>.6</bgAlpha>
							<buttonWidth>400</buttonWidth>
							<buttonHeight>150</buttonHeight>
							<buttonColor>0XFF0000</buttonColor>							
							<buttonAlpha>1</buttonAlpha>
							<align vcenter="0" hcenter="0" />
							<label>
								<text>PLAY AGAIN</text>
								<style size="35" color="#FFFFFF" align="center" font="Arial" bold="true" />
								<align hcenter="0" vcenter="0" />
							</label>
							<action type="playSound" trigger="touchDown">sndButton</action>													
						</squareButton>
						<squareButton id="bt_ABOUT">
							<bgWidth>400</bgWidth>
							<bgHeight>150</bgHeight>
							<bgColor>0XFF0000</bgColor>
							<bgAlpha>.6</bgAlpha>
							<buttonWidth>400</buttonWidth>
							<buttonHeight>150</buttonHeight>
							<buttonColor>0XFF0000</buttonColor>							
							<buttonAlpha>1</buttonAlpha>
							<align vcenter="200" hcenter="0" />
							<label>
								<text>ABOUT</text>
								<style size="35" color="#FFFFFF" align="center" font="Arial" bold="true" />
								<align hcenter="0" vcenter="0" />
							</label>
							<action type="playSound" trigger="touchDown">sndButton</action>														
						</squareButton>
					</controls>
				</portrait>				
			</layout>;
		
		// about
		public static const LAYOUT_ABOUT_XML : XML = 
			<layout name="Layout_about" id="About" version="1.0" author="Grégory Lardon" dpi="220">
				<portrait>				
					<bgColor>#000000</bgColor>	
					<bgAlpha>0.7</bgAlpha>		
					<bgImage>bgImage</bgImage> 
					<controls>
						<squareButton id="bt_BACK">
							<bgWidth>400</bgWidth>
							<bgHeight>150</bgHeight>
							<bgColor>0XFF0000</bgColor>
							<bgAlpha>.6</bgAlpha>
							<buttonWidth>400</buttonWidth>
							<buttonHeight>150</buttonHeight>
							<buttonColor>0XFF0000</buttonColor>							
							<buttonAlpha>1</buttonAlpha>
							<align vcenter="0" hcenter="0" />
							<label>
								<text>BACK</text>
								<style size="35" color="#FFFFFF" align="center" font="Arial" bold="true" />
								<align hcenter="0" vcenter="0" />
							</label>
							<action type="playSound" trigger="touchDown">sndButton</action>														
						</squareButton>
					</controls>
				</portrait>				
			</layout>;
		
	}
}