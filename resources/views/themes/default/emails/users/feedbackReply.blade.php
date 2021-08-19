@component('mail::message')
Hello, {{$user->first_name}}:<br>

For your feedback:

@component('mail::panel')
{{$model->content}}
@endcomponent

Our response is as follows:

@component('mail::panel')
{{$data->content}}
@endcomponent

@component('mail::button', ['url' => route('user.my.feedback.reylies', ['parent_id'=>$data->parent_id])])
Continued Feedback
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
