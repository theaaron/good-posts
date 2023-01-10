# Good Posts
## _An app to view and save posts._

Good Posts is an iOS app created to view posts and mark posts as favorites from the dummyJSON API.

## Architecture
Good Posts was created within the MVC framework. There are three View Controllers: PostsFeedVC, FavoritePostsVC, and PostVC.

FavoritePostsVC and PostsFeed VC are the two views that are created by the UITabBarController. 
![A screenshot of a code snippet that shows the code for creating the tabbar.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/createTabBar.png?raw=true)


PostVC is a view that is displayed by selecting a post in PostsFeedVC or FavoritePostsVC. The View Controller then sends relevant data to PostVC to display the selected post. 

There are 4 models in this application. UsersDict, User, PostsDict, and Post. The UserDict and PostDict models are both used to take in the JSON object from the api, with the User and Post models provide the properties.

## UIKit Components
This app makes use of UIKit. The following UIKit components were used.

- UIColor
- UITableView
- UICollectionView
- UILabel
- UIButton
- UIImage

The PostVC makes use of a custom component named FavoriteButton. This custom UIButton adds specific styling and custom methods to use when clicking the button to add a post to the favorites list. This button also makes use of UIImage for styling. 
![A screenshot of a code snippet that shows the custom class FavoriteButton](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/favButton.png?raw=true)

## Design
Good Posts has two screens to view Posts: The Posts tab, and the Favorites tab. The posts tab is a UITableView that displays all posts. Each cell of the table displays the post title and the post author. 
![A photo of all three screens in the app.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/allVCs.png?raw=true)

The Favorites tab contains a UICollectionView of posts that have been added to favrorites. Each cell contains the post title. Favorites implements a UICollectionView so that there will be no confusion between the Favorites tab and Posts tab.

## Features
Good posts features data persistence. To add a post to your favorites, simply click the heart button. The favorites tab will be updated whenever you navigate back to the tab, even if you have closed the app.
![A gif of favoriting and unfavoriting a post.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/favingPosts.gif?raw=true)

Good Posts will also work in either dark mode or light mode. 
![A photo of Good Posts in dark mode and in light mode.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/lightDarkMode.png?raw=true)



