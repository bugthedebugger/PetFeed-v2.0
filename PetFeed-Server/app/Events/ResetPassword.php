<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class ResetPassword implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $channel;
    public $oldPassword;
    public $newPassword;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($channel, $oldPassword, $newPassword)
    {
        $this->channel = $channel;
        $this->oldPassword = $oldPassword;
        $this->newPassword = $newPassword;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PresenceChannel($this->channel);
    }

    public function broadcastAs()
    {
        return 'petfeed-reset-password';
    }
}
