<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class ConnexionController extends Controller
{
    public function register(Request $request)
    {
        /*
        $request->validation([
            'name' => 'required|string|max:50',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);
        */
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => $request->password,
        ]);
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => $user
        ]);
    }

    public function login(Request $request)
{
    // Validez les données du formulaire


    // Récupérez l'utilisateur correspondant à l'email fourni
    $user = User::where('email', $request->email)->first();

    // Vérifiez si l'utilisateur existe et si le mot de passe correspond
    if (!$user || $user->password !== $request->password) {
        throw ValidationException::withMessages([
            'email' => ['Email ou mot de passe incorrect'],
        ]);
    }

    // Connectez manuellement l'utilisateur
    Auth::login($user);

    // Générez un token d'authentification
    $token = $user->createToken('auth_token')->plainTextToken;

    // Retournez une réponse JSON avec les informations nécessaires
    return response()->json([
        'access_token' => $token,
        'token_type' => 'Bearer',
        'id' => $user->id
    ]);
}

    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return response()->json([
            'message' => 'Supprimé'
        ]);
    }
}
