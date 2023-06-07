<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\Client;
use Carbon\Carbon;

class ProjectController extends Controller
{
    public function getData(Request $request)
    {
        $projects = Project::query()->with('client')->orderByDesc('project_id');

        // Filter berdasarkan Project Name
        if ($request->project_name) {
            $projects->where('project_name', 'LIKE', '%' . $request->project_name . '%');
        }

        // Filter berdasarkan Project Client
        if ($request->client_id) {
            $projects->where('client_id', $request->client_id);
        }

        // Filter berdasarkan Project Status
        if ($request->project_status) {
            $projects->where('project_status', $request->project_status);
        }

        $filteredCount = $projects->count();

        // Ambil semua data jika tidak ada filter yang diterapkan
        if (!$request->all()) {
            $data = $projects->get();
        } else {
            // Ambil data dengan kondisi filter dan batasan jumlah data
            $data = $projects->offset($request->start)
                ->limit($request->length)
                ->get();
        }

        $response = [
            'draw' => $request->draw,
            'recordsTotal' => Project::count(),
            'recordsFiltered' => $filteredCount,
            'data' => $data,
        ];

        return response()->json($response);
    }

    public function index()
    {
        $projects = Project::all();
        $clients = Client::all();
        $title = 'Halaman Project';
        $page = "project";
        return view('pages.project', compact('title', 'page', 'projects', 'clients'));
    }

    public function store(Request $request)
    {
        $project = new Project();
        $project->project_name = $request->project_name;
        $project->client_id = $request->client_id;
        $project->project_start = $request->project_start;
        $project->project_end = $request->project_end;
        $project->project_status = $request->project_status;
        $project->save();

        return response()->json(['message' => 'Project created successfully']);
    }

    public function edit($project_id)
    {
        $project = Project::findOrFail($project_id);

        return response()->json([
            // 'baru' => $project->getOriginalProjectStart(),
            'data' => $project
        ]);
    }

    public function update(Request $request, $project_id)
    {

        $project = Project::findOrFail($project_id);
        $project->project_name = $request->project_name;
        $project->client_id = $request->client_id;
        $project->project_start = $request->project_start;
        $project->project_end = $request->project_end;
        $project->project_status = $request->project_status;
        $project->save();

        return response()->json(['message' => 'Project updated successfully']);
    }

    public function destroy(Request $request)
    {
        Project::whereIn('project_id', $request->selectedProjects)->delete();

        return response()->json([
            'message' => 'Selected projects deleted successfully'
        ]);
    }


}