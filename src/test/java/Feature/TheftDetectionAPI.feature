Feature: Theft Detection API

  Background:
    * url 'http://35.224.48.100:8080/voice/analyze'

  Scenario: Positive - AI generated voice

    Given multipart file sample = { read: 'audiobox.wav' }
    When method post
    Then status 200
    * def APIResponse = response
    And match APIResponse.analysis.additionalInfo.backgroundNoiseLevel == "low"
    And match APIResponse.analysis.additionalInfo.emotionalTone == "neutral"
    And match APIResponse.analysis.detectedVoice == "true"
    And match APIResponse.analysis.voiceType == "AI"
    And match APIResponse.status == "success"

  Scenario: Negative - No audio file included

    Given url 'http://35.224.48.100:8080/voice/analyze'
    When method post
    Then status 200
    * def APIResponse = response
    And match APIResponse.error == "No file part"


  Scenario: Negative - No voice in audio file

    Given multipart file sample = { read: 'NoAudio.mp3' }
    When method post
    Then status 200
    * def APIResponse = response
    And match APIResponse.analysis.detectedVoice == "false"
    And match APIResponse.status == "success"

  Scenario: Negative - Corrupted audio file

    Given multipart file sample = { read: 'Corrupted.mp3' }
    When method post
    Then status 500


  Scenario: Positive - AI generate American

    Given multipart file sample = { read: 'AIAmerican.mp3' }
    When method post
    Then status 200
    * def APIResponse = response
    And match APIResponse.analysis.additionalInfo.backgroundNoiseLevel == "low"
    And match APIResponse.analysis.additionalInfo.emotionalTone == "neutral"
    And match APIResponse.analysis.detectedVoice == "true"
    And match APIResponse.analysis.voiceType == "AI"
    And match APIResponse.status == "success"

  Scenario: Positive - AI generate British

    Given multipart file sample = { read: 'AIBritish1.wav' }
    When method post
    Then status 200
    * def APIResponse = response
    And match APIResponse.analysis.additionalInfo.backgroundNoiseLevel == "low"
    And match APIResponse.analysis.additionalInfo.emotionalTone == "neutral"
    And match APIResponse.analysis.detectedVoice == "true"
    And match APIResponse.analysis.voiceType == "AI"
    And match APIResponse.status == "success"

  Scenario: Positive - AI generate Indian

    Given multipart file sample = { read: 'AIIndian.mp3' }
    When method post
    Then status 200
    * def APIResponse = response
    And match APIResponse.analysis.additionalInfo.backgroundNoiseLevel == "low"
    And match APIResponse.analysis.additionalInfo.emotionalTone == "neutral"
    And match APIResponse.analysis.detectedVoice == "true"
    And match APIResponse.analysis.voiceType == "AI"
    And match APIResponse.status == "success"

  Scenario: Positive - Human

    Given multipart file sample = { read: 'Human.wav' }
    When method post
    Then status 200
    * def APIResponse = response
    And match APIResponse.analysis.additionalInfo.backgroundNoiseLevel == "low"
    And match APIResponse.analysis.additionalInfo.emotionalTone == "neutral"
    And match APIResponse.analysis.detectedVoice == "true"
    And match APIResponse.analysis.voiceType == "human"
    And match APIResponse.status == "success"

  Scenario: Positive - Human1

    Given multipart file sample = { read: 'Human1.wav' }
    When method post
    Then status 200
    * def APIResponse = response
    And match APIResponse.analysis.additionalInfo.backgroundNoiseLevel == "low"
    And match APIResponse.analysis.additionalInfo.emotionalTone == "neutral"
    And match APIResponse.analysis.detectedVoice == "true"
    And match APIResponse.analysis.voiceType == "human"
    And match APIResponse.status == "success"

  Scenario: Positive - AI generated

    Given multipart file sample = { read: 'AI.wav' }
    When method post
    Then status 200
    * def APIResponse = response
    And match APIResponse.analysis.additionalInfo.backgroundNoiseLevel == "low"
    And match APIResponse.analysis.additionalInfo.emotionalTone == "neutral"
    And match APIResponse.analysis.detectedVoice == "true"
    And match APIResponse.analysis.voiceType == "AI"
    And match APIResponse.status == "success"
