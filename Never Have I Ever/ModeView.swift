//
//  ModeView.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/14/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import SwiftUI

struct ModeView: View {
    @Binding var show: Bool
    @EnvironmentObject var playerManager: PlayerManager
    @EnvironmentObject var questionManager: QuestionManager
    @State var showing: Bool = false
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            NavigationLink(destination: NormalModeView(show: $show), isActive: self.$showing) {
                Text("")
            }
            VStack(spacing: 0){
                
                HStack(spacing: UIScreen.main.bounds.width / 3) {
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    
                    Text("Mode")
                        .foregroundColor(.white)
                        .font(.custom("Hiragino Sans", size: 25)).bold()
                        .frame( alignment: .center)
                    
                    Spacer(minLength: 0)
                }
                    
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
                .padding([.horizontal, .bottom])
                
                VStack(spacing: -16){
                    
                    NormalView(showing: $showing)
                    
                    SportsView(showing: $showing)
                    
                   DareView(showing: $showing)
                   
                    
                    NostalgicView(showing: $showing)
                    
                }
                
                
               
                
                Spacer(minLength: 0)
            }
            
        }
            
            
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct NormalView: View {
    let questionArray = ["If you have ever sang in the shower", "If you have ever removed your wisdom teeth", "If you have ever copied someone's assignment", "If you have ever driven a car", "If you have ever farted in class", "If you have ever held in pee to not miss the movie", "If you have ever adjusted your hair when the opposite gender walks by", "If you have ever been embarassed when going to the mall with your family", "If you have ever spent money on something useless", "If you have ever been caught staring at a girl's butt", "If you have ever lied to a teacher", "If you have ever stalled time in class by talking to a teacher", "If you have ever kissed someone", "If you have ever been in a fight", "If you have ever keyed a car", "If you have ever cheated on a test",  "If you have ever had a pet", "If you have ever called the police", "If you have ever cried for no reason", "If you have ever been cheated on", "If you have ever snuck out of the house", "If you have ever been attacked by a dog", "If you have ever worn someone else's clothes", "If you have ever lied for someone else's sake", "If you have ever shaved your legs", "If you have ever kissed someone random", "If you have ever traveled outside of the country", "If you have a passport", "If you have ever been skiing", "If you have ever sent a message to the wrong person", "If you have ever accidentally liked someone's Instagram post", "If you have never accidentally posted something embarrassing on social media", "If you have ever met a celebrity",  "If you have ever gotten surgery", "If you have ever been called a nickname", "If you have never read Harry Potter", "If you have ever been wakeboarding or water skiing", "If you have ever lost your phone", "If you have ever played the piano at a party", "If you have ever paid for someone else's food", "If you have ever stolen from a store", "If you have ever slept in class", "If you have ever ignored someone for a day", "If you have ever forged your parent's signature", "If you have ever pulled an all nighter", "If you have ever ran a marathon", "If you have ever eaten at a restaurant for over 60 dollars per person", "If you have ever been to Disney World", "If a celebrity has ever DM'ed you", "If you have ever slept over your alarm", "If you have ever gotten into a car crash", "If you have ever been pulled over by the police", "If you have ever been drug tested", "If you have ever asked someone on a date", "If you have ever been asked on a date", "If you have ever ditched school in the middle of the day", "If you have ever broken your phone", "If you have ever been driven somewhere while sitting in the trunk", "If you have ever been to a football game", "If you have ever watched an NBA game in person", "If you have ever watched an NFL game in person", "If you have ever tripped and fell in the school hallway", "If you have ever failed a test", "If you have ever worked somewhere", "If you have ever gotten a flat tire", "If you have ever gone to summer school", "If you have ever gone viral on TikTok", "If you have ever gotten a tattoo", "If you have ever ghosted someone through texts", "If you have ever been embarrassed in front of your crush", "If you have ever had a crush on your teacher", "If you have ever had a crush on someone's girlfriend or boyfriend", "If you have ever punched someone before", "If you have ever owned a Gameboy", "If you have ever worn pants in public without underwear", "If you have ever been in public without a bra", "If you have ever guessed someone's password correctly", "If you have ever snooped through someone's phone", "If you have ever prank called someone", "If you have ever lied to your parents", "If you have ever learned an instrument", "If you have ever talked back to a teacher", "If you have ever stolen one of your friend's belongings", "If you have ever missed your flight", "If you have ever whipped someone with a towel", "If you have ever mixed random condiments into a drink", "If you have ever not payed for your food", "If you have ever raced someone while driving on the road", "If you have ever lost your earbuds", "If you have ever accused someone else for something that you did",  "If you have ever cheated on someone", "If you have ever rejected someone", "If you have ever taken pictures of yourself on your friend's phone", "If you have ever written things in a diary", "If you have ever snuck into a movie theater", "If you have ever been dared to ask someone out", "If you have ever been on a talent show", "If you have ever cried over a bad grade", "If you have ever pulled an all nighter just to study for a test", "If you have ever decided to not study because you knew you were going to fail", "If you have ever made a Youtube video", "If you have ever streamed video games online", "If you have ever worn makeup", "If you have ever told someone that you didn't want to be friends anymore", "If you have ever Googled how to be hotter", "If you have ever Googled how to get a girlfriend or boyfriend", "If you have ever written a song", "If you have ever had a leadership position in a club", "If you have ever used VSCO", "If you have ever been left out when your friends make plans", "If you have ever fake texted to not appear lonely", "If you have ever taken a dump without wiping", "If you have ever toilet papered a house", "If you have ever eaten raw eggs", "If you have ever broken a bone", "If you have ever traveled on an airplane", "If you have ever gone on a road trip for more than 12 hours", "If you have ever been in a taxi", "If you have ever pretended to be sick to skip school", "If you have ever cried in the shower", "If you have ever pantsed someone in public", "If you have ever made a fake social media account", "If you have ever been to a school dance", "If you have ever had an embarrassing haircut", "If you have ever lied about your name", "If you have ever been on Omegle", "If you have ever been to the opposite gender restroom", "If you have ever peed in a bush", "If you have ever poured water on someone while they were sleeping", "If you have ever changed the music when your parents were in the car", "If you have ever been in a relationship", "If you have ever messed up while presenting a project or speech in class", "If you have ever missed the school bus", "If you have ever missed your stop while using public transportation", "If you have ever shaved your eyebrows", "If you have ever dyed your hair", "If you have ever eaten food off the ground", "If you have ever peed in your pants", "If you have ever sung karaoke",  "If you have ever locked yourself out of the house", "If you have ever been under anesthesia", "If you have ever cried in public", "If you have ever been in a car accident", "If you have ever laughed so hard that you peed", "If you have ever shaved your legs", "If you have ever been bitten by a dog", "If you have ever screamed while watching a horror movie", "If you have ever driven a golf cart", "If you have ever been golfing", "If you have ever been fishing", "If you have never been to church", "If you have ever been to a summer camp", "If you have ever been on a cruise", "If you have ever blocked someone on social media", "If you have ever been sent a gift on Valentine's Day", "If you have ever been fooled on April Fools", "If you have ever sent someone a gift on Valentine's Day", "If you have ever been to a concert", "If you have ever been to an amusement park", "If you have ever been to a water park", "If you have ever been sightseeing", "If you have ever swam with dolphins", "If you have never fed an animal", "If you have never been to the zoo", "If you have ever had to get glasses", "If you have ever broken your glasses", "If you have ever worn contacts", "If you have ever stayed overnight at school", "If you have ever listened to one song on repeat for more than an hour", "If you have ever been struck by lightning", "If you have ever ridden a motorcycle", "If you have ever had a friend that moved away", "If you knew that 17 times 3 was 51", "If you have ever played spin the bottle", "If you have ever gotten stuck on a swing", "If you have ever been on TV", "If you have never been in a parade", "If you have ever broken a piñata", "If you have ever told someone that they had bad breath", "If you have never swallowed your gum", "If you have never played the piano", "If you have ever been in a band", "If you have ever sung in front of a crowd", "If you have ever told someone that they smell bad", "If you have ever bought new clothes to look cool", "If you have ever been told that you smell bad", "If you have a sibling", "If you have never worn jeans", "If you have never worn tights", "If you have never been to the hospital", "If you have ever stayed the night at a hospital", "If you have ever been to a protest", "If you have ever been in an advertisement", "If you have never watched a 3D movie", "If you have ever traveled alone", "If you have ever been on an airplane flight longer than 10 hours", "If you have ever hiked up a mountain", "If you have ever been to the Grand Canyon", "If you have ever been to Las Vegas", "If you have never won a prize at a amusement park", "If you have never been on a Ferris Wheel", "If you have ever eaten deep fried food", "If you have ever bought something for free because of discounts", "If you have ever tricked someone into buying you something", "If you have ever stolen your parent's credit card to buy something", "If you have ever sleepwalked", "If you have ever taken an ice bath", "If you have ever stuck gum under a table", "If you have ever fallen asleep at the movies", "If you have ever shaved your head", "If you have never had fried chicken", "If you have never had sushi", "If you have ever donated blood", "If you have ever lost your luggage at the airport", "If you have ever been in a cave", "If you have ever owned a flip phone", "If you have ever moved houses", "If you have ever been in a Lamborghini" , "If you have ever been in a Ferrari", "If you have never played Candy Crush", "If you have ever had ballet lessons", "If you have never bought an IPhone", "If you have ever listened to a Taylor Swift song", "If someone in this room has slept over with you", "If someone in this room has ever bought you a present", "If someone in this room does not follow you on social media", "If someone in this room has ever pranked you", "If someone in this room has ever been on vacation with you", "If someone in this room has ever kissed you", "If you have ever beaten someone in this room in 8-ball", "If you have ever tripped someone in this room", "If you have ever had a flag in your bedroom", "If you have ever owned LED lights in your bedroom", "If you have ever broken your laptop", "If you have ever broken someone in this room's belongings", "If you have ever stolen someone in this room's belongings", "If you have ever broken a window", "If you have never been bowling", "If you have ever hada Facebook account", "If you have ever been sent to the principal's office", "If you have ever had a credit card", "If you have never cried while watching a movie", "If you have ever streamed on Twitch", "If you have ever lost at least 20 dollars over a bet", "If you have ever been stuck in quicksand", "If you have ever owned a truck", "If you have ever broken a lock", "If you have ever had food poisoning", "If you have ever been hunting", "If you have ever been vegetarian", "If you have ever eaten more than a 20 ounce steak", "If you have ever shot a deer", "If you have ever pinched yourself to stop yourself from laughing", "If you have never clogged a toilet", "If you have ever used a leaf as toilet paper", "If you have ever went to school on a weekend", "If you have ever walked into a glass door", "If you have ever given up your seat to someone else on public transportation", "If you have ever snuck into a concert", "If you have ever met a rapper in person", "If you have ever solved a Rubik's cube", "If you have ever spilt a drink on someone else's carpet", "If you have ever ignored someone saying hi to you", "If you have ever played paintball", "If you have ever been to a trampoline park", "If you have ever been to a skate park", "If you have ever built your own computer", "If you have ever created an app", "If you have ever winged a presentation in school", "If you have never had a birthday party", "If you have never watched Stars Wars", "If you have never watched Avengers", "If you have ever owned an Android phone", "If you have ever created your own food recipe", "If you have never eaten frozen yogurt", "If you have ever eaten lobster", "If you have ever thrown up in school", "If you have ever had your phone taken away in school", "If you have ever been in a choir", "If you have never played a sport", "If you have ever been in an ambulance", "If you have ever punched a hole in a wall", "If you have never had a flu shot", "If you have ever been to a therapist", "If you have ever been hypnotized", "If you have ever been suspended from school", "If you have ever played Mafia", "If you have never been to the beach", "If you have never had a bloody nose", "If you have ever asked a friend for test answers", "If you have ever lied about your age", "If you have ever lied about your birthday", "If you have ever been to Europe", "If you have ever worn a tuxedo", "If you have ever had an Afro haircut", "If you have ever gotten a perm", "If you have ever shaved your chest", "If you have ever gotten your eyes dilated", "If you have ever witnessed a car crash", "If you have ever slept with someone else's girlfriend/boyfriend", "If you have Spotify on your phone currently", "If you have ever clogged a toilet"]
    @EnvironmentObject var questionManager: QuestionManager
    @Binding var showing: Bool
    var body: some View{
        Image("Norm")
            .resizable()
            .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
            .cornerRadius(17)
            .padding()
            .shadow(color: .black, radius: 2, x: 0, y: 0)
            .onTapGesture {
                self.showing.toggle()
                self.questionManager.chosenArray = self.questionArray
                self.questionManager.firstColor = Color.normFirstColor
                self.questionManager.secondColor = Color.normSecondColor
                print(self.questionArray.count)
                //302
        }
    }
    
}

struct SportsView: View {
    let questionArray = ["If you have ever ran a marathon before", "If you have ever completed a Murph", "If you have ever played more than 3 sports", "If you have ever ran a 5K before", "If you have ever taken supplements",  "If you have ever dunked on somebody", "If you have ever woken up before 6 in the morning to workout", "If you have ever swam more than 2 miles at once", "If you have ever biked more than 50 miles at once", "If you have ever completed more than 10 pull ups at once", "If you have ever completed more than 50 push ups at once", "If you have scored more than 30 points in a basketball game", "If you have skipped repetitions during a practice", "If you can do the splits", "If you have ever ran 100 meters in under 12 seconds", "If you have ever had a vertical of more than 30 inches", "If you have ever slept over a practice", "If you have ever nutmegged someone in soccer", "If you have ever crossed someone up in basketball", "If you have ever felt dizzy in the gym after lifting", "If you have ever kicked a field goal further than 25 yards", "If you have ever thrown up during a practice", "If you have ever benched at least 225 pounds", "If you have ever swam 50 yards in less than 30 seconds", "If you have ever took a nap after a hard workout", "If you have ever played better during a game when the other gender is watching", "If you have ever won a sports tournament", "If you have ever received a college sports offer", "If you have ever been punished during a sports practice", "If you have ever made a joke when doing conditioning", "If you have ever done suicides", "If you have ever made up an excuse for skipping practice", "If you have ever been kicked out of a practice", "If you have ever Googled how to get bigger muscles", "If you have ever had a six pack", "If you have ever injured yourself in a sports match", "If you have ever gone to the gym for more than 4 months in a row", "If you have ever taken an ice bath", "If you have ever played on a baseball team", "If you have ever played on a varsity sports high school team"]
    @EnvironmentObject var questionManager: QuestionManager
    @Binding var showing: Bool
    var body: some View{
        Image("sportscrop")
            .resizable()
            .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
            .cornerRadius(17)
            .padding()
            .shadow(color: .black, radius: 2, x: 0, y: 0)
            .onTapGesture {
                self.showing.toggle()
                self.questionManager.chosenArray = self.questionArray
                self.questionManager.firstColor = Color.normFirstColor
                self.questionManager.secondColor = Color.normSecondColor
                print(self.questionArray.count)
        }
    }
}

struct DareView: View {
   

    let questionArray = [ "If you have ever had a friend with benefits", "If you have ever had sex in a car", "If you have ever had sex on the first date", "If you have ever had a hickey", "If you have ever kissed on the first date", "If you have ever been caught having sex", "If you have ever changed clothes in public", "If you have ever had a crush with someone in this room", "If you have ever kissed someone in this room", "If you have ever cheated on someone", "If you have ever ghosted someone", "If you have ever lied about having a boyfriend/girlfriend", "If you have ever had a one night stand", "If you have ever watched porn", "If you have ever seen someone in this room naked", "If you have ever seen your bestfriend naked", "If you have ever gotten back with your ex", "If you have ever prank called someone", "If you have ever fantasized about someone in this room", "If you are still a virgin", "If you have ever uploaded an embarrassing video on the Internet", "If you have ever snooped on someone's social media accounts", "If you have ever cheated on an exam", "If you have ever lied to someone in this room", "If you have ever rejected someone", "If you have ever dated two people at the same time", "If you have ever kissed someone that you didn't like", "If you have ever DM'ed a model", "If you have ever blocked someone on social media", "If you have ever sent someone a gift on Valentine's Day", "If you have ever kissed someone and regretted it", "If you have ever been to scared to talk to someone", "If you have ever farted in class", "If you have ever sharted", "If you have ever been kicked out of a friend group", "If you have ever been in a friend group with your ex", "If you have ever drawn a weiner on someone", "If you have ever hated someone in this room", "If you have ever been too shy to ask someone out", "If you have ever bought a condom", "If you have ever been on birth control", "If you have ever played spin the bottle", "If you have ever hooked up with your friend's crush", "If you have ever dated your friend's crush", "If you have ever hooked up with someone while on a date with someone else", "If you have ever seduced someone", "If you have ever told someone that they had bad breath", "If you have ever pressured a friend to break up", "If you have ever had a crush on one of your teachers", "If you have ever had a crush on one of your friend's parents", "If you have ever worn underwear from someone of the opposite gender", "If you have ever talked your way out of a traffic ticket", "If you have ever told someone that they suck at kissing", "If you have ever had a secret relationship", "If you have ever told your ex that you want to get back together", "If you have ever gambled", "If you have ever lied to impress someone and got caught", "If you have ever called a friend in order to escape your date", "If you have ever smoked", "If you have ever drank alcohol", "If you have ever driven a car without your driver's license",]
    @EnvironmentObject var questionManager: QuestionManager
    @Binding var showing: Bool
    var body: some View{
        Image("darecrop")
            .resizable()
            .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
            .cornerRadius(17)
            .padding()
            .shadow(color: .black, radius: 2, x: 0, y: 0)
            .onTapGesture {
                 
                self.showing.toggle()
                 self.questionManager.chosenArray = self.questionArray
                self.questionManager.firstColor = Color.dareFirstColor
                self.questionManager.secondColor = Color.dareSecondColor
                  print(self.questionArray.count)
                //55
        }
        
        
    }
   
}

struct NostalgicView : View {
    let questionArray = ["If you have ever owned a Gameboy", "If you have never watched Cartoon Network", "If you have never watched Nickelodeon", "If you have ever used a scooter board in elementary school", "If you have never listened to Hey There Delilah", "If you have ever played Club Penguin", "If you have never owned a Wii", "If you have ever owned SillyBandz", "If you have ever owned BeyBlades", "If you have ever played with Bakugans", "If you have never played with Pokémon cards", "If you have ever made a Rainbowloom", "If you have ever owned a PSP", "If you have ever played Poptropica", "If you have ever eaten Lunchables", "If you have ever played the Concentration Handclap game", "If you have ever eaten Dunkaroos", "If you have ever played Super Mario Galaxy", "If you have never owned an XBox 360", "If you have never owned a PlayStation 3", "If you have never watched Spongebob", "If you have never watched the Simpsons", "If you have ever watched the Teletubbies", "If you have ever completed the multiplication tables in elementary school", "If you have ever learned cursive in elementary school", "If you have ever bought a poster at the Scholastic bookfair", "If you have never bought a book at the Scholastic bookfair", "If you have ever bought Invisible Ink at the bookfair", "If you have ever drawn the cartoon \"S\" in school because you were bored", "If you have ever gone under the parachute in elementary school", "If you have ever typed 5319009 on a calculator", "If you have ever collected Box Tops at school", "If you have ever done a fake mechanical pencil shot", "If you have ever had to take Flintstone vitamin gummies", "If you have never bought a Lego set", "If you have ever tried to make a ball using Play-Doh", "If you have ever watched The Suite Life of Zack & Cody", "If you have ever played Minecraft with your friends", "If you have ever owned a Nintendo DS", "If you have ever watched Bill Nye videos in class", "If you have ever watched The Magic School Bus in class", "If you have ever watched Kenny the Shark", "If you have ever watched Dragon Tales", "If you have ever sat on the Buddy Bench", "If you have ever gotten stuck on a swing", "If you have ever owned a flip phone", "If you have ever owned a Blackberry", "If you have ever played Candy Crush", "If you have ever played Jetpack Joyride", "If you have ever played Clash of Clans", "If you have ever played Doodle Jump", "If you have ever drank Danimals yogurt", "If you have never used a hula hoop"]
    @EnvironmentObject var questionManager: QuestionManager
    @Binding var showing: Bool
    var body: some View {
        Image("nostalgiccrop")
        .resizable()
        .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
                   .cornerRadius(17)
                   .padding()
                   .shadow(color: .black, radius: 2, x: 0, y: 0)
                   .onTapGesture {
                       self.showing.toggle()
                        self.questionManager.chosenArray = self.questionArray
                    self.questionManager.firstColor = Color.nostalgicFirstColor
                    self.questionManager.secondColor = Color.nostalgicSecondColor
                    print(self.questionArray.count)
               }
    }
}


struct ModeView_Previews: PreviewProvider {
    static var previews: some View {
        ModeView(show: .constant(false)).environmentObject(PlayerManager())
    }
}
