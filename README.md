# A Topic Generator API

An API to store topics and ratings of each topic. Additionally, the New York Times API is configured to make

# A Topic Generator API

Link to live-application: http://rdelvallej32.github.io/chitchat-client/

Link to front end repo: https://github.com/rdelvallej32/chitchat-client

Link to back end repo: https://github.com/rdelvallej32/chitchat-api

##### Technologies used (back end):

Ruby, Rails

PostgreSQL

New York Times API

##### Technologies used (front end):

Javascript, jQuery, AJAX

HTML 5 / CSS 3

Bootstrap

Handlebars

#### Notes:

This app is a work in progress! The ratings of each topic does not show the avg. User score and the ratings do not change what topic the User receives when they ask for one.

## API end-points

Verb   | URI Pattern        | Controller#Action
----   | -----------        | -----------------
POST   | `/sign-up`         | `users#signup`
POST   | `/sign-in`         | `users#signin`
DELETE | `/sign-out/:id`    | `users#signout`
PATCH  | `/change-password` | `users#changepw`
GET    | `/ratings`         | `ratings#index`
POST   | `/ratings`         | `ratings#create`
GET    | `/ratings/:id`     | `ratings#show`
PATCH  | `/ratings/:id`     | `ratings#update`
DELETE | `/ratings/:id/`    | `ratings#destroy`
GET | `/random-show`    | `topics#randomshow`
GET | `/show-nyt`    | `topics#shownyt`


All data returned from API actions is formatted as JSON.

---
## User actions
*Summary:*
<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/sign-up`</td>
<td><strong>credentials</strong></td>
<td>201, Created</td>
<td><strong>user</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/sign-in`</td>
<td><strong>credentials</strong></td>
<td>200 OK</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/sign-out/:id`</td>
<td>empty</td>
<td>201 Created</td>
<td>empty</td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/change-password/:id`</td>
<td><strong>passwords</strong></td>
<td>204 No Content</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### signup

The `create` action expects a *POST* of `credentials` identifying a new user to create, e.g. using `FormData`:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
  <input name="credentials[password_confirmation]" type="password" value="an example password">
</form>

```

or using `JSON`:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password",
    "password_confirmation": "an example password"
  }
}
```

The `password_confirmation` field is optional.

If the request is successful, the response will have an HTTP Status of 201, Created, and the body will be JSON containing the `id` and `email` of the new user, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad Request, and the response body will be empty.

### signin

The `signin` action expects a *POST* with `credentials` identifying a previously registered user, e.g.:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
</form>
```

or:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password"
  }
}
```

If the request is successful, the response will have an HTTP Status of 200, OK, and the body will be JSON containing the user's `id`, `email`, and the `token` used to authenticate other requests, e.g.:
```json
{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "an example authentication token"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 401 Unauthorized, and the response body will be empty.

### signout

The `signout` actions is a *DELETE* specifying the `id` of the user so sign out.

If the request is successful the response will have an HTTP status of 204 No Content.

If the request is unsuccessful, the response will have a status of 401 Unauthorized.

### changepw

The `changepw` action expects a PATCH of `passwords` specifying the `old` and `new`.

If the request is successful the response will have an HTTP status of 204 No Content.

If the request is unsuccessful the reponse will have an HTTP status of 400 Bad Request.

---

The `sign-out` and `change-password` requests must include a valid HTTP header `Authorization: Token token=<token>` or they will be rejected with a status of 401 Unauthorized.

## Rating actions

All rating action requests must include a valid HTTP header `Authorization: Token token=<token>` or they will be rejected with a status of 401 Unauthorized.

*Summary:*
<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>GET</td>
<td>`/ratings`</td>
<td>n/a</td>
<td>200, OK</td>
<td><strong>rating found</strong></td>
</tr>
<tr>
<td>POST</td>
<td>`/ratings`</td>
<td>n/a</td>
<td>201, Created</td>
<td><strong>rating created</strong></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/ratings/:id`</td>
<td><em>empty</em></td>
<td>200, OK</td>
<td><strong>rating created</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### index
The `index` action is a *GET* that retrieves all the ratings associated with a user.  The response body will contain JSON containing an array of ratings, e.g.:

```json
{
  "raings": [
    {
      "id": 1,
      "score": "2",
      "user_id": "1",
      "topic_id": "4"
    ,
      "id": 2,
      "score": "5",
      "user_id": "1",
      "topic_id": "5"
    }
  ]
}
```

If there are no ratings associated with the user, the response body will contain an empty ratings array, e.g.:

```json
{
  "ratings": [
  ]
}
```

### create

The `create` action expects a *POST* with an empty body (e.g `new FormData()` or `''` - if JSON,  `'{}'`).  If the request is successful, the response will have an HTTP Status of 201, Created, and the body will contain JSON of the created ratings e.g:

```json
"rating": {
  "score": "2",
  "user_id": "1",
  "topic_id": "4"
}
}'
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad Request, and the response body will be JSON describing the errors.

### update

This `update` action expects an empty (e.g `''` or `'{}'` if JSON) *PATCH* to
 change a rating.

If the request is successful, the response will have an HTTP Status of 200 OK,
 and the body will be JSON containing the rating e.g.:

```json
{
  "rating": {
    "id": 1,
    "score": 2,
    "user_id": 1,
    "topic_id": 3
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be empty

 ### delete

 The `delete` action expects a *DELETE* with an empty body (e.g `new FormData()` or `''` - if JSON,  `'{}'`).  If the request is successful, the response will have an HTTP Status of 204, No Content, and the body will contain JSON of the deleted rating e.g:

 ```json
 "rating": {
   "score": "2",
   "user_id": "1",
   "topic_id": "4"
 }
 }'
 ```

 If the request is unsuccessful, the response will have an HTTP Status of 400 Bad Request, and the response body will be JSON describing the errors.

## [License](LICENSE)

Source code distributed under the MIT license.
