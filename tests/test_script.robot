*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     HttpLibrary.HTTP
#Library     RequestsLibrary
#Library     ExtendedRequestsLibrary
#Library     BuiltIn


*** Variables ***
BASE_URL = https://httpbin.org/


*** Test Cases ***
GET basic request
    Create Session    httpbin         https://httpbin.org
    ${resp}=    Get Request     httpbin     /get
    Status Should Be  200      ${resp}


POST basic request
    ${resp}=    Post Request     httpbin     /post
    Status Should Be  200      ${resp}
    Request Should Be Successful     ${resp}
#    Dictionary Should Contain Value  ${resp.json()}       authenticated=true


AUTH basic request positive
    Create Session    httpbin         https://httpbin.org
    ${resp}=    Get Request     httpbin     /basic-auth/user/passwd
    Status Should Be  200      ${resp}
    Request Should Be Successful     ${resp}
#    Dictionary Should Contain Value  ${resp.json()}       args


AUTH basic request negative
    Create Session    httpbin         https://httpbin.org
    ${resp}=    Get Request     httpbin     /basic-auth/test/ythtyhtyh
    Status Should Be  401      ${resp}
