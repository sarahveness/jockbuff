
require 'httparty'
    user_leagues_full = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=363/teams", headers:{
    "Authorization" => "Bearer yFUyDPWQo10hofB0iJUmkv65zIB_p5hVkVX._IqOIFlO4ykvcTJmUTLCNVwZxrVDSPciWycu4jTx6KnxDb4.gSglKyfNh85HnWY1_WwjKpd91My2IF8CIcs2FmoBhRwpG4OQY66AeeAer5rDazoWhmfQtqtIWsxGdqthytWSLnKPKAEzKdNA3Md4EuF9P96eNJeItqDMu9eIH5Z5Vzyny1H8qxNbetVzI7H13WDatj2bWZ673.LDdDGc2iDcG2GBPhtHlUBf5RsXPCBof1pdrONWUf8IXnQAa6vGaZZg.vLNrO3y58DJt8aBfsvWLeyhUZZ562PWmuB2ecBcNk5m7B4k8z7YZPwHlg0ytUHvgGPr8xh0kTVUlAh7dTq2q_Wgvzrluv9V9h7J0TCHIuiXx8i4wjxH4rRNAtEXuDMohcBJyv4hq4GQGwS2kXcXhUDyrx1fgm0M2x1_S1RzWyIkw6OIFG1ij9AiKGQUOJSjfrHOzobZu0hc6hoouPESetRa2SiWcdHEGP4uGe._xToWg4hapnVW9cJKZWNHcXb4LrCi.O.8SdlE28cpLOaxWhWisvQ3T97reh8Ase..AdpuJN_jzCUJM0xnmbFRJP7htmOaFchUwT3eQvsxmGxlpTa32yY1tgOmPu8GqFTZVk2A8yydKp8A6eGUjmT0oFKkH_s8S4MEJhKS3aoRKw8NWYH6WEMzetKwwtW73byxnvcMyjD7.OwiNxFgjUjkZXibWWxhk0mmRt7tUPyyzC1np6kFvn5VZGUl48OmkvraQmGtKtQmzQgy0dOgGz1JVrGwW7igfvUO6K9GMzLCMePokwPXKOJ7tQAAVRkyjq9f6JJdFLYTZawaYknB4S7Ll2Wqp0Q7.7Q6Iu3dHH0tCMeA"
    })
    puts user_leagues_full