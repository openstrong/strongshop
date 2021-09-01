@component('mail::message')

@component('mail::table')
|        |          |
| :------------- |:-------------|
| @lang('Login ID')      | {{$user->email}}      |
| @lang('Login IP')      | {{$user->last_login_ip}}      |
| @lang('Login Time')      | {{$user->last_login_at}}      |
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
