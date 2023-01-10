# Good Posts
## _An app to view and save posts._

Good Posts is an iOS app created to view posts and mark posts as favorites from the dummyJSON API.

## Architecture
Good Posts was created within the MVC framework. There are three View Controllers: `PostsFeedVC`, `FavoritePostsVC`, and `PostVC`.

`FavoritePostsVC` and `PostsFeedVC` are the two views that are created by the `UITabBarController`. 
![A screenshot of a code snippet that shows the code for creating the tabbar.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/createTabBar.png?raw=true)

`PostsFeedVC` contains a `UITableView`. Each cell is populated with with the Post Title and Post Author. The posts are fetched from dummyJSON. `PostNetworkingManager` handles the request, and converts the raw data into a `PostsDict` object. The `PostsDict` object contains one property: `posts`, of which the type is an array of type `Post`.

`FavoritePostsVC` contains a `UICollectionView`. Each cell is populated with a Post Title. Each post is fetched from UserDefaults. A UserDefaultsManager.swift file has been created for handling retrieval as well as adding and removing favorites. 

`PostVC` is a view that is displayed by selecting a post in `PostsFeedVC` or `FavoritePostsVC`. The View Controller then sends relevant data to `PostVC` to display the selected post.
![Code snippet of didSelectItemAt](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/didSelectItemAt.png?raw=true) 

There are 4 models in this application. `UsersDict`, `User`, `PostsDict`, and `Post`. The UserDict and PostDict models are both used to take in the JSON object from the api, while the User and Post models provide the properties.

The `PostsNetworkingManager` and `UserDefaultsManager` were created to get posts and users from the API and from UserDefaults. `PostsNetworkingManager` can make two different network calls. The first network call provides almost all post data, but does not provide a username. The second network call gets a user by ID. The method takes in a user ID, then appends the ID to the API URL to get the correct user.
![A code snippet of the named methods in PostNeworkingManager.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/PostsNeworkingManagerCodeSnippet.png?raw=true)

`UserDefaultsManager` is made for handling favorites. When a user clicks the favorite button, the post is encoded into JSON and stored in `UserDefaults` as a `Data` object. When users view their favorites, the Data object is decoded from `UserDefaults` and displayed in a `UICollectionView` in `FavoritePostsVC`.
![A code snippet of the named methods in UserDefaultsManager.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/UserDefaultsManagerCodeSnippet.png?raw=true)

## UIKit Components
This app makes use of UIKit. The following UIKit components were used.

- `UIColor` - Used for color of backgrounds and for color of FavoritesButton
- `UITableView` - Used for `PostsFeedVC`. 
- `UICollectionView` - Used for `FavoritePostsVC`
- `UILabel` - Used within almost all views. Used for Post titles, body, and author.
- `UIButton` - Used for the FavoriteButton.
- `UIImage` - Used in `FavoriteButton` to display an SF symbol.
- `UIFont` - Used to style `FavoriteButton` and post titles and authors in `PostVC`.

The `PostVC` makes use of a custom component named `FavoriteButton`. This custom `UIButton` adds specific styling and custom methods to use when clicking the button to add a post to the favorites list. This button also makes use of `UIImage` for styling. 
![A screenshot of a code snippet that shows the custom class FavoriteButton](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/favButton.png?raw=true)

## Design
Good Posts has two screens to view Posts: The Posts tab, and the Favorites tab. The posts tab is a `UITableView` that displays all posts. Each cell of the table displays the post title and the post author. 
![A photo of all three screens in the app.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/allVCs.png?raw=true)

The Favorites tab contains a `UICollectionView` of posts that have been added to favrorites. Each cell contains the post title. Favorites implements a `UICollectionView` so that there will be no confusion between the Favorites tab and Posts tab.

After selecting a post, you are taken to the third screen, `PostVC`. `PostVC` displays the title of the post, the body and the author. There is a Heart SF Symbol that users can click to fill the icon and add the posts to favorites. 

## Features
Good posts features data persistence. To add a post to your favorites, simply click the heart button. The favorites tab will be updated whenever you navigate back to the tab, even if you have closed the app.
![A gif of favoriting and unfavoriting a post.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/persistence.gif?raw=true)

Good Posts will also work in either dark mode or light mode. 
![A photo of Good Posts in dark mode and in light mode.](https://github.com/theaaron/good-posts/blob/main/Good%20Posts/Good%20Posts/Screenshots/lightDarkMode.png?raw=true)



