<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Article;

class ArticleController extends Controller
{
    public function index()
    {
        //return response()->json(["message"=>"erreur"]);

         $articles = Article::all();
         return response()->json($articles);

    }

    public function store(Request $request)
    {
        /*
        $request->validate([
            'titre' => 'required|max:50',
            'taille' => 'required',
            'etat' => 'required',
            'marque' => 'required',
            'description' => 'required',
            'prix' => 'required|float',
            'categorie' => 'required',
            ]);
            */
            $article = new Article();
            $article->titre = $request->titre;
            $article->description = $request->description;
            $article->prix = $floatValue = floatval($request->prix);
            $article->etat = $request->etat;
            $article->user_id = $request->user_id;
            $article->marque = $request->marque;
            $article->categorie = $request->categorie;
            $article->taille = $request->taille;


            //return response()->json(["bonjour"=>$request->hasFile('photo')]);
            if ($request->hasFile('photo')) {
                $file = $request->file('photo');
                $fileName = time() . '.' . $file->getClientOriginalExtension();
                $customPath = 'C:/Stage/vinted/assets/images'; // Chemin personnalisé où vous souhaitez enregistrer le fichier

                // Assurez-vous que le dossier existe
                if (!file_exists($customPath)) {
                    mkdir($customPath, 0755, true);
                }

                $file->move($customPath, $fileName);

                // Vous pouvez maintenant enregistrer $customPath.'/'.$fileName dans votre base de données si nécessaire
                $article->photo = "assets/images/".$fileName; // Chemin relatif à partir de public_path() si vous souhaitez le rendre accessible via HTTP
            }

        $article->save();

        return response()->json(['message' => 'Ajout réussi'], 201);
    }

    public function show($id)
    {
        $article = Article::findOrFail($id);
        return response()->json($article);
    }

    public function update(request $request, $id)
    {
        $article = Article::findOrFail($id);

        $request->validate( [
         'titre' => 'required|max:50',
         'taille' => 'required',
         'etat' => 'required',
         'marque' => 'required',
         'description' => 'required',
         'prix' => 'required|float',
         'categorie' => 'required',
        ]);

        $article->update([
            'titre' => $request->title,
            'taille'=> $request->taille,
            'etat'=> $request->etat,
            'marque'=> $request->marque,
            'description'=> $request->description,
            'prix'=> $request->prix,
            'categorie'=> $request->categorie,
        ]);

        return response()->json(['message' => 'modification ajouté'], 200);
    }

    public function destroy($id)
    {
        $article = Article::findOrFail($id);
        $article->delete();

        return response()->json(['message' => 'Article supprimé avec succès'], 200);
    }

}
