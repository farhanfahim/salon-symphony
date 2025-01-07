pipeline {
    agent any 

     environment {
        repo_url = "https://adilkhursheed02@bitbucket.org/devops-tekrevol/salon-symphony-2.git"
        branch = "migrate-devops"
        PATH = "/Users/jenkins/.nvm/versions/node/v20.2.0/bin:/Users/jenkins/Public/flutter-v3.3.2/bin:/Library/Frameworks/Python.framework/Versions/3.11/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Users/jenkins/Library/Android/sdk/platform-tools:/Users/jenkins/Library/Android/sdk/tools:/Users/jenkins/Library/Android/sdk/tools/bin:/Users/jenkins/Library/Android/sdk/emulator"
        credentialsId = "bitbucket-ids"
        AWS_IDPASS = credentials('AWS_Keys')
        S3_BUCKET_NAME = "tekrevol-qa-builds"
    }      

    stages {
    
        stage("Clone Code from BitBucket") {
            steps{
                sh 'pwd'
                git credentialsId: credentialsId,
                    url: repo_url,
                    branch: branch
            script {
                    commit = sh(returnStdout: true, script: 'git log -1 --oneline').trim()
                    commitMsg = commit.substring( commit.indexOf(' ') ).trim()
            }
        }
   }   
        stage('Switch to iOS directory') {
            steps {
                dir('ios') {
                    sh 'pwd'
                }
            }
        }
        stage('Install dependencies') {
            steps {
                dir('ios') {
                //    sh 'flutter doctor -v'
                    sh 'flutter clean'
                    sh 'flutter pub get'
                    sh 'pwd'
                    sh 'export LANG=en_US.UTF-8 pod install'
                }
            }
        }
        stage('Build iOS ipa app') {
            steps {
                dir('ios') {
              //      sh 'flutter build ios --release'
                  sh 'flutter build ipa'
                }
            }
        }
  //      stage('Upload IPA to S3') {
  //          steps {
  //              script{
  //                  def date = sh(returnStdout: true, script: 'date +%d-%m-%Y-%H:%M:%S').trim()
  //              sh "aws s3 cp /Users/jenkins/.jenkins/workspace/Salon-Symphony/build/ios/ipa/*.ipa s3://tekrevol-qa-builds/SalonSymphony/ipa-build/SalonSymphony-${date}.ipa"
  //              }
  //          }
 //       }
        
        stage('Validate to TestFlight') {
        	steps {
	         sh "xcrun altool --validate-app --file '/Users/jenkins/.jenkins/workspace/Salon-Symphony/build/ios/ipa/salon_symphony.ipa' --type ios --username asim@tekrevol.com --password uqoi-gnzy-zpow-kgfs"
	        }
    	}   

       stage('Upload to TestFlight') {
	       steps {
	       sh "xcrun altool --upload-app --file '/Users/jenkins/.jenkins/workspace/Salon-Symphony/build/ios/ipa/salon_symphony.ipa' --type ios --username asim@tekrevol.com --password uqoi-gnzy-zpow-kgfs"
	    }
	   }
        
    }
post {
    always {
        emailext (
         //   subject: "Pipeline: ${commitMsg}"",
            subject: "Pipeline ${currentBuild.currentResult}: ${commitMsg}",
            body: "${env.BUILD_URL}",
            attachLog: true,
            compressLog: true,
         //   recipientProviders: [[$class: 'DevelopersRecipientProvider']],
            replyTo: "adil.khursheed@tekrevol.com",
        )
    }
    success {
        emailext (
            subject: "Salon-Symphony Pipeline Succeeded And Upoaded To Test Flight: ${commitMsg}",
             body: "Salon-Symphony iOS Build For Jenkins Pipeline",
             to: "adil.khursheed@tekrevol.com, m.hammad@tekrevol.com, hiba@tekrevol.com",
            attachLog: true,
            compressLog: true,
            replyTo: "adil.khursheed@tekrevol.com",
        )
        echo "Build succeeded!"
    }
    failure {
        emailext (
            subject: "Salon-Symphony Pipeline Failed: ${commitMsg}",
            body: "Salon-Symphony iOS Build For Jenkins Pipeline",
            to: "adil.khursheed@tekrevol.com",
            attachLog: true,
            compressLog: true,
            replyTo: "adil.khursheed@tekrevol.com",
        )
        echo "Build failed!"
    }
}
}