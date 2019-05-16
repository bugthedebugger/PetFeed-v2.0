<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class RegisterDevice implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $channel;
    public $oldPassword;
    public $newPassword;
    public $type;
    public $typeId;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($channel, $password, $type, $typeId)
    {
        $this->channel = $channel;
        $this->oldPassword = 'petfeed123';
        $this->newPassword = $password;
        $this->type = $type;
        $this->typeId = $typeId;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new Channel($this->channel);
    }

    public function broadcastAs()
    {
        return 'petfeed-register';
    }
}
