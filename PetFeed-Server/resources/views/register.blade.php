@extends('layouts.app')

@section('title')
    Register Device
@endsection

@section('content')
    <form action="{{route('register.device')}}" method="POST">
        {{ csrf_field() }}
        <div class="form-group">
            <label>Device ID:</label>
            <input class="form-control" type="text" name="deviceId" required>
            <label>Device Type:</label>
            <select class="form-control" name="type" required>
                <option value="">Select Type</option>
                @foreach ($types as $type)
                    <option value="{{ $type->id }}">{{ $type->name }}</option>
                @endforeach
            </select>
            <br>
            <button class="btn btn-success" type="submit">Submit</button>
        </div>
    </form>
@endsection
