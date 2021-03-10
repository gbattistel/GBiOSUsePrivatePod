# GBiOSUsePrivatePod
A demo app that shows how to use a private pod repository.

This demo app use two private projects:
1) A private podspec repository. This repository targets to a private pod. 
2) A private pod.

# Setup a private Cocoapod library:
- My private Library is: https://github.com/gbattistel/GBPodSpec (this is for internal tracking)

1. Create a private Github repository. 
2. Create your Cocoapod framework and upload it to the private github repository. 
   You can check this nice tutorial on how to create a Cocoapod Framework:
   https://medium.com/better-programming/ios-build-your-cocoapods-framework-with-an-example-app-from-scratch-fd0f7bdf3f8c
3. Create your **.podspec** file.
4. In your **.podspec** when defining the **spec.source**, you need to consider your gihub user inside the URl, like this:

 ```
 spec.source = { :git => "https://[YourGithubUser]@github.com/gbattistel/GBiOSPrivateSDK.git", 
 :tag => "#{spec.version}" }
```

5. Commit and push your changes.
6. Create a Tag with the same name as the **spec.version** defined in the **.podspec** file. e.g:

```
git tag 0.0.1
```

7. Push the created Tag.
```
git push --tags
```

# Setup a private Specs repo:
- The Specs Repo is the repository on GitHub that contains the list of all available pods. Every library has an individual folder, which contains sub folders of the available versions of that pod. 
- My private repo is: https://github.com/gbattistel/GBPodSpec (this is for internal tracking)
- For more info check: https://guides.cocoapods.org/making/specs-and-specs-repo.html

1. Create a private Github repository for your Specs repo. 
2. Clone the repo.
3. Insde the main folder, create an other folder with the name of your Cocoapod library previously created. In my case is: **GBiOSPrivateSDK**
4. Create a subfolder with the version of the pod: **0.0.1**
5. Copy the **.podspec** file of your Cocoapod library inside the version folder. Notice that the version name has to match the **spec.version** tag inside the **.podspec** file. You should get something like:
```
      YourPodLibraryName
              |_ YourPodspecVersion
                    |_ YourPodLibraryName.podspec
```
6. Commit and push your changes. 


# Setup the App:
We are going to setup the app that will use your private **Specs repo** and private **pods**

1. Go to the root folder of your XCode project and open the Podfile. If you don't have one, just run:
```
pod init
```

2. Inside the Podfile add the new Specs repo: (Change the the url to your Specs repo)
```
source 'git@github.com:gbattistel/GBPodSpec.git'
```

3. Add your pod:
```
pod 'GBiOSPrivateSDK', '0.0.1'
```

4. Open a terminal in the root directory of your XCode project and run:
```
pod install
```
5. If everything it's ok, your private pod should be added into your project:

<img width="726" alt="Screen Shot 2021-03-10 at 18 08 47" src="https://user-images.githubusercontent.com/4660743/110697866-b03c0600-81cb-11eb-9187-282276b7a7c6.png">

# Troubleshooting
Due that we are using private repositories we could run into authentication errors. If that's the case:
1) Check the defined repo url in your .podspec file (spec.source)
2) To validate the spec.source, just copy the url and try to clone it. If you are able to clone that repo, it means that your Github setup is ok. 
3) If you have problems cloning the repo, just setup an SSH key: https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent





