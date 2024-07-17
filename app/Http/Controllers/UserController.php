<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;


class UserController extends Controller
{
    public function index()
    {
        return User::all();
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required|string|max:50',
            'email' => 'required|string|email|max:225|unique:users',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()){
            return response()->json($validator->errors(),400);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => hash::make($request->password),
        ]);

        return response()->json([
            'message'=>'compte ajouté',201
        ]);
    }

    public function show(string $id)
    {
        return User::findOrFail($id);
    }

    public function update(Request $request, string $id)
    {
        $user = User::findOrFail($id);

        $validator = Validator::make($request->all(),[
            'name' => 'sometimes|required|string|max:50',
            'email' => 'sometimes|required|string|email|max:255|unique:users,email,' . $user->id,
            'password' => 'sometimes|required|string|min:8',
        ]);

        if ($validator->fails()){
            return response()->json($validator->errors(),400);
        }

        $user->update($request->all());

        return response()->json([
            'message'=>'modification ajouté',
            $user
        ]);
    }

    public function destroy(string $id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return response()->json([
            'message'=>'supprimé',204
        ]);
    }
}
