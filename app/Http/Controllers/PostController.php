<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Post;

class PostController extends Controller
{

    public function __construct()
    {
        return $this->middleware('auth'); //Permettra d'interdit //l'utilisateur de ne pas voir les fonction dans ce //controller sans être logger
    }

    public function create()
    {
        return View('posts.create');
    }

    public function store()
    {

        $data = request()->validate([
            'caption' => ['required', 'string'],
            'image' => ['required', 'image'],
        ]);

        $imagePath = request('image')->store('uploads', 'public');
        $image = Image::make(public_path("/storage/{$imagePath}"))->fit(1200, 1200);
        $image->save();

        auth()->user()->posts()->create([

            "caption" => $data['caption'],
            "image" => $imagePath,
        ]);

        return redirect()->route('profiles.show', ['user' => auth()->user()]);
    }

    public function show(Post $post)
    {
        return View('posts.show', compact('post'));
    }
}
