
# import tweepy

# CONSUMER_KEY = 'aZmm8raHzdT3minFTUTLhEgtQ'
# CONSUMER_SECRET='DNuBtahlnMsd5G2jT04JPZhEqgQyhLQbPFMlWVRXOHkzk8C3LS'
# BEARER_TOKEN='AAAAAAAAAAAAAAAAAAAAAN%2BCdgEAAAAA0Pn6wQjreWQlffZ2ax8FkzMoxo0%3DBZXKhVEPgUqionbvsN8WK6cL34ApANWpnmB4tdEkJIhpMtDrb4'
# ACCESS_TOKEN='1535560498556858370-BeEvN27t1gH344ZX8aBYGGZmrsWSdV'
# ACCESS_TOKEN_SECRET='mnv2OfpecXHhbRjacx8xrVAo72hyRXKqZl6w8ZyI6mCsZ'

# client = tweepy.Client(consumer_key=CONSUMER_KEY,
#                        consumer_secret=CONSUMER_SECRET,
#                        bearer_token=BEARER_TOKEN,
#                        access_token=ACCESS_TOKEN,
#                        access_token_secret=ACCESS_TOKEN_SECRET
#                        )
                      
# # response = client.create_tweet(text='Hello World, This is Ramesh goud from Codebook.in. This tweet is from Python Program')
# # print(response)
# query='from:imVkohli -is:retweet'
# file_name='tweet.txt'

# with open(file_name, 'a+') as filehandle:
#     for tweet in tweepy.Paginator(client.search_recent_tweets, query=query,
#                                   tweet_fields=['context_annotations', 'created_at'], 
#                                   max_results=100).flatten(
#             limit=1000):

# for tweet in tweets.data:
#     if len(tweet.context_annotations):
#         print(tweet)

