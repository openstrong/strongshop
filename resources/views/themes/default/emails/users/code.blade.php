@component('mail::message')

The body of your message.{{$data['id']}}

@component('mail::button', ['url' => $url])
Button Text
@endcomponent

@component('mail::table')
| Laravel       | Table         | Example  |
| ------------- |:-------------:| --------:|
| Col 2 is      | Centered      | $10      |
| Col 3 is      | Right-Aligned | $20      |
@endcomponent

@component('mail::panel')
This is the panel content.
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
